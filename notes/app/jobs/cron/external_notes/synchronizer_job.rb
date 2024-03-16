class Cron::ExternalNotes::SynchronizerJob < ApplicationJob
  queue_as :high

  retry_on Faraday::TimeoutError, wait: :exponentially_longer, attempts: 11
  discard_on ActiveRecord::RecordInvalid, ActiveRecord::RecordNotFound,
             ActiveJob::DeserializationError do |_job, error|
    Rails.logger.error "Cron::ExternalNotes::SynchronizerJob raises exception, #{[error, message].join}"
  end

  def perform
    ExternalNotes::Synchronizer.new.execute
  end
end
