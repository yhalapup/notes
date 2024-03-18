require "mongo"

Rails.application.config.mongodb_client =
  @mongodb_client ||= Mongo::Client.new(
    [ENV.fetch("MONGO_DATABASE_HOST").to_s],
    database: ENV.fetch("MONGO_DB").to_s,
    user: ENV.fetch("MONGO_USER").to_s,
    password: ENV.fetch("MONGO_PASSWORD").to_s
  )
