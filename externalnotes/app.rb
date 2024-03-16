require "sinatra"
require "json"

require_relative "notes_obtainer"

get "/notes" do
  NotesObtainer.new.execute.to_json
end
