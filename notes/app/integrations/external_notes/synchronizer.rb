class ExternalNotes::Synchronizer
  def execute
    external_notes = ExternalNotes::Notes::ListFetcher.new.execute
    save_external_notes_in_database(external_notes)
  end

  private

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
