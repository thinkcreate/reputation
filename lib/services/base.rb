module Reputation
  class Service
    require 'open-uri'
    require 'hpricot'
    
    attr_reader :account
    
    def initialize(account)
      @account = account
    end
    
    def profile_page
      begin
        @profile_page ||= Hpricot(open(account_uri))
      rescue OpenURI::HTTPError
        # assume no account
        puts "No account named '#{account}' found on #{self}"
        exit(1)
      end
    end
    
    def render_items
      result = []
      
      max_description_len = self.class.items.collect{|_, description| description.size}.max
      
      self.class.items.each do |name, description|
        gap = max_description_len - description.size
        
        result      << "#{description}: #{' ' * gap}"
        result.last << self.send(name)
      end
      result.join("\n")
    end
    
    def to_s
      self.class.to_s.split('::').last.gsub(/^./){$&.upcase}
    end
    
    
    # CLASS
    def self.inherited(sub)
      sub.class_eval{ @items = []}
    end
    
    def self.item(name, description, &block)
      self.send(:define_method, name) do
        result = instance_eval(&block)
        # assume Hpricot::Elem
        result.inner_text.strip rescue result
      end
      self.items << [name, description]
    end
    
    def self.items
      @items
    end
    
    def self.class_for(service)
      service_name = service.camelize
    
      Reputation.const_get(service_name)
    end
  end
end