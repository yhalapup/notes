class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :handle_validation_error

  private

  def handle_not_found
    render json: { errors: [{ detail: "Record not found" }], status: 404 }, status: :not_found
  end

  def handle_validation_error(exception)
    errors_details = exception.record.errors.full_messages.map { |message| { detail: message } }
    render json: { errors: errors_details, status: 400 }, status: :bad_request
  end
end
