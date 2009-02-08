module Reputation
  class Github < Service
    
    item(:name, 'Full name') do
      (profile_page%'div.vcard span#profile_name')
    end

    item(:member_since, 'Member since') do
      member_since = (profile_page%"label[text()*='Member Since:']").following.inner_text.strip
      days_ago = (Date.today - Date.parse(member_since)).to_i
      "#{member_since} (#{days_ago} days)"
    end

    item(:public_repos, 'Public repositories') do
      cCreated, cForked = %w(Created Forked).collect do |text| 
        (profile_page/"li.project div.meta[text()*='#{text}']").size
      end
      "#{cCreated + cForked} (created: #{cCreated}, forked: #{cForked})"
    end
    
    item(:followers, 'Followers') do
      (profile_page%"label[text()*='Followers:']").following
    end
    
    def account_uri
      "http://github.com/#{account}"
    end
  end
end