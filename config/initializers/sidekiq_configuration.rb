require 'redis'

Sidekiq.configure_server do |config|
  config.redis = { host: ENV["REDIS_IP"], port: ENV["REDIS_PORT"], namespace: 'tombstone' }
end
