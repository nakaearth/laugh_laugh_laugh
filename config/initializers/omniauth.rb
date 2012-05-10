Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, ENV['TWITTER_TOKEN'],ENV['TWITTER_SECRET']
  provider :facebook, ENV['FACEBOOK_APP_ID'],ENV['FACEBOOK_SECRET_KEY'],{:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}}
end
