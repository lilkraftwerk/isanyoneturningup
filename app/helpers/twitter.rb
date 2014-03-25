helpers do
  def make_twitter
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = CONFIG["twitter"]["consumer"]
      config.consumer_secret = CONFIG["twitter"]["consumer_secret"]
      config.access_token        = CONFIG["twitter"]["access_token"]
      config.access_token_secret = CONFIG["twitter"]["access_secret"]
      client
    end
  end
end
