Rails.application.config.middleware.use OmniAuth::Builder do
  provider :reddit, Rails.application.secrets.reddit_key, Rails.application.secrets.reddit_secret
end
