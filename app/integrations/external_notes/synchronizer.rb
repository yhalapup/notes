class ExternalNotes::Synchronizer
  def initialize
  end

  def execute
    external_notes = parse_fetch_request_external_notes
    save_external_notes_in_database(external_notes)
  end

  private

  def parse_fetch_request_external_notes
    response =  ExternalNotes::Api::Client.new.get(path: "")
    JSON.parse(response.body)
  end

  def save_external_notes_in_database(external_notes)
    external_notes.each do |external_note|
      Note.find_or_create_by!(external_note_fk: external_note["id"]) do |note|
        note.title = external_note["title"]
        note.content = external_note["content"]
        note.source = "externalnotes"
      end
    end
  end
end
