Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Settings.twitter.consumer_key, Settings.twitter.consumer_secret
end
Rails.application.config.middleware.use OmniAuth::Builder do
  facebook_permissions = Settings.facebook.permissions.required + Settings.facebook.permissions.optional
  provider :facebook, Settings.facebook.app_id, Settings.facebook.app_secret,
           :scope => facebook_permissions.join(','),
           :locale => 'ja_JP'
end
OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
