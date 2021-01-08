class PortfolioPolicy < ApplicationPolicy
  def show?
    true
  end

  def update?
    admin?
  end

  def create?
    update?
  end

  def destroy?
    admin?
  end

  private

  def admin?
    namespace = Rails.application.credentials.auth0[:namespace]
    roles = user[0][namespace + '/roles']
    roles.include?('admin')
  end
end
