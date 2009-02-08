module Reputation
  class Twitter < Service
        
    item(:name, 'Name')   { (profile_page%"ul.entry-author span.fn") }
    item(:updates, 'Updates')   { (profile_page%"span#update_count") }
    item(:followers, 'Followers') { (profile_page%"span#follower_count") }
    item(:following, 'Following') { (profile_page%"span#following_count") }
  
    def account_uri
      "http://twitter.com/#{account}"
    end
  end
end