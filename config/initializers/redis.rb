#config/initializers/redis.rb

REDIS_CONFIG = YAML.load( File.open( Rails.root.join("config/redis.yml") ) ).symbolize_keys

dflt = REDIS_CONFIG[:default].symbolize_keys

if (REDIS_CONFIG[Rails.env.to_sym] && Rails.env == "production")
  url = eval(REDIS_CONFIG[Rails.env.to_sym]["url"])
  REDIS_CONFIG[Rails.env.to_sym]["url"] = url
  cnfg = REDIS_CONFIG[Rails.env.to_sym].symbolize_keys
else
  cnfg = dflt
end

#$redis_ns = Redis::Namespace.new(cnfg[:namespace], :redis => $redis) if cnfg[:namespace]

require "mock_redis"

# if Rails.env == "test"
#   $redis = MockRedis.new
# else
  $redis = Redis.new(cnfg)
# end

$redis.flushdb
