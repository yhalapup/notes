class ExternalNotes::Synchronizer
  def execute
    external_notes = ExternalNotes::Notes::ListFetcher.new.execute
    external_notes = add_source_value(external_notes)
    save_external_notes_in_database(external_notes)
  end

  private

  def save_external_notes_in_database(external_notes)
    Note.insert_all(external_notes)
  end

  def add_source_value(external_notes)
    external_notes.map do |external_note|
      external_note[:source] = "externalnotes"
      external_note
    end
  end
end
