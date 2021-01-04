# frozen_string_literal: true

module Api
  module V1
    module ErrorsControllerLogic
      extend ActiveSupport::Concern

      EXPECTED_HTTP_ERROR_CODES = {
        unauthorized: 401,
        not_found: 404,
        unsupported_media_type: 415,
        unprocessable_entity: 422,
        internal_error: 500,
      }.freeze

      included do
        rescue_from StandardError, with: :serialize_internal_error_error
        rescue_from ActiveRecord::RecordNotFound,
                    with: :serialize_not_found_error
        rescue_from ActiveRecord::RecordInvalid,
                    with: :serialize_unprocessable_entity_error
        rescue_from ActionController::ParameterMissing,
                    with: :serialize_parameter_missing_error
      end

      private

      EXPECTED_HTTP_ERROR_CODES.each do |status, code|
        define_method("serialize_#{status}_error") do |exception|
          errors << RescuedError.new(error: exception, http_code: code)
          serialize_errors
        end
      end

      def serialize_parameter_missing_error(exception)
        errors << RescuedError.new(
          error: exception,
          http_code: 422,
          source: { parameter: exception.param },
        )
        serialize_errors
      end

      def serialize_active_record_errors(record)
        binding.pry
        errors.concat(record.errors.messages.map do |field, errors_messages|
          errors_messages.map do |error_message|
            RescuedError.new(
              error: error_message,
              http_code: 422,
              # TODO: The pointer should match the attribute path of the input
              # hash. We should standardized the input first. Ideally, we should
              # be using a standardized format such as jsonapi:
              # https://jsonapi.org/format/#crud
              source: { pointer: field },
            )
          end
        end.flatten)

        serialize_errors
      end

      def serialize_errors
        serialized_errors = ErrorSerializer.new(errors)

        render  json: serialized_errors,
                status: serialized_errors.status
      end

      def errors
        @errors ||= []
      end
    end
  end
end
