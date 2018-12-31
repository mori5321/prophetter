class TwitterClient
  def initialize(user)
    @user = user
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

  # gemの実装にbugがありうごかない
  # def direct_message(string)
  #   @client.create_direct_message(@user.screen_name, string)
  # end
  # https://qiita.com/takano-h/items/271cbe242eae2f3f02c2
end
