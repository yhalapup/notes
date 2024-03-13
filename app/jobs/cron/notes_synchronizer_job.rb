class Cron::NotesSynchronizerJob < ApplicationJob
  queue_as :high

  def perform
    Note.create!(title: "title", content: "content")
  end
end
