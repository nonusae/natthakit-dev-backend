class PortfolioPolicy < ApplicationPolicy
  def update?
    ## TODO: refactor this
    namespace = Rails.application.credentials.auth0[:namespace]
    roles = user[0][namespace + '/roles']
    roles.include?('admin')
  end
end
