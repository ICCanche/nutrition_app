Koala.configure do |config|
    config.app_id = ENV["facebook.app_id"]
    config.app_secret = ENV["facebook.app_secret"]
    config.api_version = "v2.0"
    # See Koala::Configuration for more options, including details on how to send requests through
    # your own proxy servers.
  end