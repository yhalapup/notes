require_relative "mongodb_log_device"
require_relative "mongodb_formatter"

class MongodbLogger < ActiveSupport::Logger
  def initialize
    super(MongodbLogDevice.new, formatter: MongodbFormatter.new)
  end
end
