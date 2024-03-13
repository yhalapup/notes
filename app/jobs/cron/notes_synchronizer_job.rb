class Cron::NotesSynchronizerJob < ApplicationJob
  queue_as :high

  def perform
  end
end
