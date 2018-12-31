class TwitterClient
  def initialize(user)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.credentials.twitter[:api_key]
      config.consumer_secret     = Rails.application.credentials.twitter[:api_secret]
      config.access_token        = user.access_token
      config.access_token_secret = user.access_token_secret
    end
  end

  def post(string)
    @client.update(string)
  end
end
