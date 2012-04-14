Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :twitter, 'Jn1parDOEgcmc3KrYt3zA','4FzkDgOz18DvjYSD9SH7MygCHQSUsnFTbJ1lH8NYj0'
end
