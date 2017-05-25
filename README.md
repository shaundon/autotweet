# autotweet
Auto Tweet to harass a company into pulling their fingers out

Installed Ruby and necessary gem via:

```bash
installed Ruby 2.00 curl -sSL https://get.rvm.io | bash
rvm source /etc/profile.d/rvm.sh
rvm install 2.0.0 ruby -v
gem install twitter
```
Edit autoTweet.rb to reflect your API keys:

```ruby
config.consumer_key = "xxxxxxx"
config.consumer_secret = "xxxxxxx"
config.access_token = "xxxxxxx"
config.access_token_secret = "xxxxxxx"
```
Added cron entry as follows for minutely harrassment, replacing out correct file paths:

```bash
*/1 * * * * /usr/local/rvm/wrappers/ruby-2.0.0-p645/ruby /filepathtoscript/autoTweet.rb >> /filepathtoscript/tweet.log 2>&1
```
