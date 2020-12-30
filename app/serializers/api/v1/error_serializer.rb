# frozen_string_literal: true

# Adhere to standard JSON API error response formatting, to include sending
# back the proper status code:
# https://jsonapi.org/examples/#error-objects-multiple-errors
module Api
  module V1
    class ErrorSerializer < ApplicationSerializer
      # The JSON API spec doesn't require ids for error objects:
      set_id { false }

      attribute :detail, :source, :title, :status

      # fast_jsonapi uses a fixed "data" root which does not comply with the
      # JSON API spec for the errors response
      def hash_for_collection
        serialized_hashes = super[:data]&.map { |hash| sanitize_values(hash) }
        { errors: serialized_hashes }
      end

      def hash_for_one_record
        serialized_hash = sanitize_values(super[:data])
        { errors: [serialized_hash] }
      end

      # Use a generic 400 error when there are many types of errors in one
      # request, see https://jsonapi.org/format/#errors-processing.
      def status
        uniform_status? ? statuses.first : :bad_request
      end

      private

      def statuses
        @statuses ||= Array(@resource).map(&:status).uniq
      end

      def uniform_status?
        statuses.count == 1
      end

      def sanitize_values(serialized_value)
        error = serialized_value[:attributes]
        error.except!(:status) if uniform_status?

        # Removing empty values is optional but it reduces the payload size:
        error.compact
      end
    end
  end
end
