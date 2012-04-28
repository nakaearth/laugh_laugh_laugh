Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, 'Jn1parDOEgcmc3KrYt3zA','4FzkDgOz18DvjYSD9SH7MygCHQSUsnFTbJ1lH8NYj0'
  provider :facebook, ENV['FACEBOOK_APP_ID'],ENV['FACEBOOK_SECRET_KEY'],{:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}}
end
