require 'redis'

Sidekiq.configure_server do |config|
  config.redis { namespace: "tombstone" }
end

Sidekiq.configure_client do |config|
  config.redis { namespace: "tombstone" }
end
