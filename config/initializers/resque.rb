#  Configure resque
Resque.inline = true if Rails.env.test?

ENV["RAILS_ENV"] || "development"
config_file = Rails.root.join("config/redis.yml")

YAML.load(ERB.new(File.read(config_file)).result)
Resque.redis = Redis.new(host: "redis", port: 6379)

Resque.logger.level = Logger::INFO
Resque.logger = Logger.new(Rails.root.join("log", "#{Rails.env}_resque.log"))
