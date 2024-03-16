#  Configure resque
Resque.inline = true if Rails.env.test?

rails_env = ENV['RAILS_ENV'] || 'development'
config_file = Rails.root.join("config/redis.yml")

resque_config = YAML::load(ERB.new(IO.read(config_file)).result)
Resque.redis = resque_config[rails_env]

Resque.logger.level = Logger::INFO
Resque.logger = Logger.new(Rails.root.join("log", "#{Rails.env}_resque.log"))
