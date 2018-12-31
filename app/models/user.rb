class User < ApplicationRecord
  has_many :prophets

  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    name = auth[:info][:name]
    image_url = auth[:info][:image]

    user = self.find_or_initialize_by(provider: provider, uid: uid)
    user.name = name
    user.image_url = image_url
    user.access_token = auth.extra.access_token.token
    user.access_token_secret = auth.extra.access_token.secret


    user.save
    return user
  end

  def tweet(str)
    TwitterClient.new(self).post(str)
  end
end
