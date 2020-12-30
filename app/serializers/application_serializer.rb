# frozen_string_literal: true

class ApplicationSerializer
  include JSONAPI::Serializer

  set_key_transform :camel_lower

  def self.url_helpers
    @url_helpers ||= Rails.application.routes.url_helpers
  end
  private_class_method :url_helpers
end
