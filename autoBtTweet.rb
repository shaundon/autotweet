#!/usr/bin/ruby

# Creates a custom daily tweet to annoy the hell out of BTCare
# @BTcare [days] [phrase1] [phrase2] [hashtag]


require 'date'
require 'twitter'

def pick_random_line(fileName)
  File.readlines(fileName).sample
end

$twitter = Twitter::REST::Client.new do |config|
  config.consumer_key = "xxxxxxx"
  config.consumer_secret = "xxxxxxx"
  config.access_token = "xxxxxxx"
  config.access_token_secret = "xxxxxxx"
end

# Get twitter account we will be tweeting to
tweetRecipient = "@BTCare"

# Get the number of days since BT disaster started
daysSinceStart = (Date.parse("01/12/2014")-Date.parse(Time.now.to_s)).to_i.abs

# Get random first phrase
phrase1 = pick_random_line("phrase1.txt").chomp

# Get random second phrase
phrase2 = pick_random_line("phrase2.txt").chomp

# Get random hash tag
hashtag = pick_random_line("hashtags.txt").chomp

# Build tweet
dynamicTweet = tweetRecipient + " " + daysSinceStart.to_s + " days " + phrase1 + " " + phrase2 + " " + hashtag

if dynamicTweet.length>140
	puts "ERROR: Tweet too long"
else
	puts dynamicTweet
	$twitter.update(dynamicTweet)
end
