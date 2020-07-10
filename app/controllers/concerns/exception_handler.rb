module ExceptionHandler
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordInvalid do |e|
      render json: { message: e.message }, status: :precondition_failed
    end

    rescue_from ActiveRecord::NestedAttributes::TooManyRecords do |e|
      render json: { message: "São permitidos no máximo 5 registros de respostas" }, status: :precondition_failed
    end

    rescue_from ActiveRecord::RecordNotFound do |e| # Ruby Error Handling
      render status: :NotFound, json: ''
    end
  end
end