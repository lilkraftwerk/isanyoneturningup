get '/' do
  erb :index
end

get '/deleteolder'
  @tweets = Tweet.where(["created_at < ?", 1.day.ago])
  delete_older_tweets(@tweets)
  "#{@tweets.count.to_s} done for!"
end

get '/getmore' do
  more_tweets
  "#TurnDown4What"
end

get '/tweet' do
  Tweet.first(:order => "RANDOM()").to_json
end