if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_aFwSOaG8xE8HMsX2LAVhoyef',
    secret_key: 'sk_test_CfkHvvxtvpwm7nV6EtVDXFxB'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
