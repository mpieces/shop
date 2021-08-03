Rails.application.configure do
  config.stripe.secret_key = Rails.application.credentials.stripe[:development][:secret_key]
  config.stripe.publishable_key = Rails.application.credentials.stripe[:development][:publishable_key]
end
