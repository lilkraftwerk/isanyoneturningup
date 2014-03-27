helpers do
  def make_twitter
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = CONFIG["TWITTER_KEY"]
      config.consumer_secret = CONFIG["TWITTER_SECRET"]
      config.access_token        = CONFIG["TOKEN"]
      config.access_token_secret = CONFIG["TOKEN_SECRET"]
      client
    end
  end
end
