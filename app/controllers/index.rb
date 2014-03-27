get '/' do
  erb :index
end

get '/deleteolder' do
  @count = Tweet.count
  @tweets = Tweet.where(["created_at < ?", 1.day.ago])
  deleted_count = @tweets.count
  delete_older_tweets(@tweets)
  @new_count = Tweet.count
  "#{@tweets.count.to_s} deleted. From #{@count} to #{@new_count}"
end

get '/getmore' do
  first_count = Tweet.count
  more_tweets
  second_count = Tweet.count
  "#TurnDown4What: from #{first_count} to #{second_count}"
end

get '/tweet' do
  Tweet.first(:order => "RANDOM()").to_json
end