libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir)

require 'services/base'
Dir[libdir+'/services/**/*.rb'].each{|s| require s}

module Reputation
  extend self
  
  def self.run(args = ARGV)
    unless ARGV.size == 2
      puts(usage)
      exit
    end
    
    service_name = args.first
    account = args.last
    
    begin
      @service = Service.class_for(service_name).new(account)
    rescue NameError
      puts "Err: No service named '#{service_name}' found!"
      puts usage
      exit
    end
    
    puts(<<-RESULT.trim)
    Account '#{account}' on #{@service}
    
    #{@service.render_items}
    
    RESULT
  end
  
  def self.usage()<<-USAGE.trim
    Usage:
    #{$0} <service> <account-name>
    
    Supported services:
    - github
    - twitter
    - youtube
    
    USAGE
  end
  
end


class String
  def camelize
    self.gsub(/\/(.?)/) { "::#{$1.upcase}" }.gsub(/(?:^|_)(.)/) { $1.upcase }
  end
  
  def trim
    self.gsub(/^ +/, '')
  end
end