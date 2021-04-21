#config/initializers/redis.rb

REDIS_CONFIG = YAML.load( File.open( Rails.root.join("config/redis.yml") ) ).symbolize_keys

default = REDIS_CONFIG[:default].symbolize_keys

if (REDIS_CONFIG[Rails.env.to_sym] && Rails.env == "production")
  url = eval(REDIS_CONFIG[Rails.env.to_sym]["url"])
  REDIS_CONFIG[Rails.env.to_sym]["url"] = url
  config = REDIS_CONFIG[Rails.env.to_sym].symbolize_keys
else
  config = default
end

$redis = Redis.new(config)
$redis.flushdb
