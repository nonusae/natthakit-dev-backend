# frozen_string_literal: true

module Api
  module V1
    class RescuedError
      attr_reader :source

      def initialize(error:, http_code:, title: nil, source: nil)
        @error = error
        @http_code = http_code
        @title = title
        @source = source
      end

      def detail
        return @error.message if @error.respond_to?(:message)

        @error
      end

      def status
        @http_code
      end

      def title
        @title || Rack::Utils::HTTP_STATUS_CODES[@http_code]
      end
    end
  end
end
