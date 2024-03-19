class Cron::ExternalNotes::SynchronizerJob < ApplicationJob
  queue_as :high

  retry_on Faraday::Error, wait: :polynomially_longer, attempts: 11

  def perform
    ExternalNotes::Synchronizer.new.execute
  end
end
