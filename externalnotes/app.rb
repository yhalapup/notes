require "sinatra"
require "json"
require "faker"

require_relative "notes_obtainer"

get "/" do
  NotesObtainer.new.to_json
end
