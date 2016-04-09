$client = Twitter::REST::Client.new do |config|
  config.consumer_key    = "KCug9pRNwBVsNl9pYi8tDBsFW"
  config.consumer_secret = "ace9JApl2K1151MY43u21KLUntwi0TNU7GMHMuxCvozZmyLR6c"
  config.access_token = "8522512-MwNBQeG2qE4xWuZRwEBOZ4P7JhjSXpxYDHolIAkfzJ"
  config.access_token_secret = "hU6eTILVtCy13BJuq8F6tpssYm5JkMS8uPEHPJQgXeZz8"
end

def collect_with_max_id(collection=[], max_id=nil, &block)
  response = yield(max_id)
  collection += response
  response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
end

def $client.get_all_tweets(user)
  collect_with_max_id do |max_id|
    options = {count: 200, include_rts: true}
    options[:max_id] = max_id unless max_id.nil?
    user_timeline(user, options)
  end
end