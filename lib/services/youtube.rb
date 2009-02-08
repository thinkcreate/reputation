module Reputation
  class Youtube < Service
    item(:videos_submitted, "Videos submitted") do
      (profile_page%"a[@name*='channel-box-item-count']")
    end
    
    item(:member_since, "Member since") do
      (profile_page%"strong#user-profile-member-since")
    end
    
    item(:subscribers, "Subscribers") do
      (profile_page%"strong#user-profile-subscriber-count")
    end
    
    def account_uri
      "http://www.youtube.com/user/#{account}"
    end
  end
end