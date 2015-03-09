require 'redis'

Sidekiq.configure_server do |config|
  config.redis = { namespace: 'tombstone' }
end
