get '/' do
  erb :index
end

get '/getmore' do
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
  client.search("turned up").take(200).collect do |tweet|
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

get '/tweet' do
  Tweet.first(:order => "RANDOM()").to_json
end