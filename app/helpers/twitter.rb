helpers do
  def make_twitter
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = ENV["TWITTER_KEY"]
      config.consumer_secret = ENV["TWITTER_SECRET"]
      config.access_token        = ENV["TOKEN"]
      config.access_token_secret = ENV["TOKEN_SECRET"]
      client
    end
  end

  def more_tweets
    client = make_twitter
    client.search("turnup").take(200).collect do |tweet|
      if tweet.geo?
        Tweet.create(
        tweet_id: tweet.id,
        url: tweet.url,
        coords: tweet.geo.coords,
        content: client.oembed(tweet.id).html,
        lat: tweet.geo.lat,
        long: tweet.geo.long
        )
      end
    end
    client.search("turn up").take(200).collect do |tweet|
      if tweet.geo?
        Tweet.create(
        tweet_id: tweet.id,
        url: tweet.url,
        coords: tweet.geo.coords,
        content: client.oembed(tweet.id).html,
        lat: tweet.geo.lat,
        long: tweet.geo.long
        )
      end
    end
    client.search("tututu").take(200).collect do |tweet|
      if tweet.geo?
        Tweet.create(
        tweet_id: tweet.id,
        url: tweet.url,
        coords: tweet.geo.coords,
        content: client.oembed(tweet.id).html,
        lat: tweet.geo.lat,
        long: tweet.geo.long
        )
      end
    end
    client.search("turnt").take(200).collect do |tweet|
      if tweet.geo?
        Tweet.create(
        tweet_id: tweet.id,
        url: tweet.url,
        coords: tweet.geo.coords,
        content: client.oembed(tweet.id).html,
        lat: tweet.geo.lat,
        long: tweet.geo.long
        )
      end
    end
    client.search("turn down for what").take(200).collect do |tweet|
      if tweet.geo?
        Tweet.create(
        tweet_id: tweet.id,
        url: tweet.url,
        coords: tweet.geo.coords,
        content: client.oembed(tweet.id).html,
        lat: tweet.geo.lat,
        long: tweet.geo.long
        )
      end
    end
  end

  def delete_older_tweets(old_tweets)
    old_tweets.each do |tweet|
      tweet.destroy
    end
  end

end
