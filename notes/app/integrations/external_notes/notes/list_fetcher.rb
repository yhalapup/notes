class ExternalNotes::Notes::ListFetcher
  PATH = "notes".freeze

  def execute
    response =  ExternalNotes::Api::Client.new.get(path: PATH)
    JSON.parse(response.body)
  end
end
