class User < ActiveRecord::Base
    def self.find_or_create_from_auth_hash(auth_hash)
        user = where(provider: auth_hash.provider, uid: auth_hash.uid).first_or_create  
        user.update(
            name: auth_hash.info.name,
            profile_image: auth_hash.info.image,
            token: auth_hash.credentials.token,
            secret: auth_hash.credentials.secret,
            )
        user
    end
    
    def twitter
        @client ||= Twitter::REST::Client.new do |config|
        config.consumer_key    = "KCug9pRNwBVsNl9pYi8tDBsFW"
        config.consumer_secret = "ace9JApl2K1151MY43u21KLUntwi0TNU7GMHMuxCvozZmyLR6c"
        config.access_token = token
        config.access_token_secret = secret
        end
    end

end
