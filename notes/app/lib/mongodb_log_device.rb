class MongodbLogDevice
  def initialize
    @client = Rails.application.config.mongodb_client
    @collection = access_collection

    create_collection
  end

  def write(message)
    @collection.insert_one(message)
  end

  def reopen(log = nil)
    access_collection
  end

  def close
  end

  private

  def create_collection
    @collection.create
  end

  def access_collection
    collection_name = "notes_application_logs"
    options   = {
      capped: true,
      size: 1024*1024
    }
    @collection = @client[collection_name, options]
  end
end
