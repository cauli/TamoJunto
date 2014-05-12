class DiagnosticPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    user.present?
  end

  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def questions?
    user.present?
  end

  def new?
    user.present?
  end
end
