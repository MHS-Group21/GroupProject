require 'twitter'

$client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "wpblQ8ZjqLZL3eVtmYalhyC4N"
    config.consumer_secret     = "l8gQDlMkLOWY3UxQ9Hi9gDibxNUqYbT9l5KmAZDxOWZqoWJPiZ"
    config.access_token        = "1379017066909425666-P4bZpAFmDHJaB6xIVOKwwglq3RtvIk"
    config.access_token_secret = "B9E9zPfYk8cYNvFjWySWTQCinD8mqEwdem3qiZX5Re0Id"
end