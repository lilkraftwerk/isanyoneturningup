get '/' do
  erb :index
end

get '/doit' do
  first_count = Tweet.count
  more_tweets
  second_count = Tweet.count
  @count = Tweet.count
  @tweets = Tweet.where(["created_at < ?", 5.days.ago])
  deleted_count = @tweets.count
  delete_older_tweets(@tweets)
  @new_count = Tweet.count
  "#TurnDown4What: from #{first_count} to #{second_count}. #{@tweets.count} deleted. From #{@count} to #{@new_count}"
end

get '/tweet' do
  Tweet.last(:order => "RANDOM()").to_json
end