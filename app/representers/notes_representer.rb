require 'roar/json/json_api'

class NotesRepresenter < Roar::Decorator
  include Roar::JSON::JSONAPI.resource :notes

  attributes do
    property :title
    property :content
    property :created_at
    property :updated_at
  end
end
