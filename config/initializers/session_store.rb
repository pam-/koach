require 'yaml'

redis_yaml = ERB.new(File.read("#{Rails.root}/config/redis.yml")).result
redis_config = YAML.safe_load(redis_yaml)[Rails.env]
Koach::Application.config.session_store :redis_store, servers: redis_config
