class Cron::ExternalNotes::SynchronizerJob < ApplicationJob
  queue_as :high

  retry_on Faraday::TimeoutError, wait: :polynomially_longer, attempts: 11
  retry_on ActiveRecord::RecordInvalid, wait: :polynomially_longer, attempts: 4
  discard_on ActiveJob::DeserializationError do |_job, error|
    Rails.logger.error "Cron::ExternalNotes::SynchronizerJob raises exception, #{[error, message].join}"
  end

  def perform
    ExternalNotes::Synchronizer.new.execute
  end
end
