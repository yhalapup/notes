require_relative "mongodb"
require_relative "../../app/lib/mongodb_logger"

mongodb_logger = MongodbLogger.new
Rails.logger.broadcast_to(mongodb_logger)
