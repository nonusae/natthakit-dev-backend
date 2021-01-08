class SecuredController < ApplicationController
  include Pundit
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized
  before_action :authorize_request

  def pundit_user
    @authorized_payload
  end

  private

  def authorize_request
    @authorized_payload = AuthorizationService.new(request.headers).authenticate_request!
  rescue JWT::VerificationError, JWT::DecodeError
    render json: { errors: ['Not Authenticated'] }, status: :unauthorized
  end
end
