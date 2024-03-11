#  Configure resque
if Rails.env.test?
  Resque.inline = true
end

rails_env = ENV['RAILS_ENV'] || "development"
config_file = Rails.root.join("config/redis.yml")

redis_config = YAML::load(ERB.new(IO.read(config_file)).result)
Resque.redis = Redis.new(host: 'redis', port: 6379)

Resque.logger.level = Logger::INFO
Resque.logger = Logger.new(Rails.root.join('log', "#{Rails.env}_resque.log"))
