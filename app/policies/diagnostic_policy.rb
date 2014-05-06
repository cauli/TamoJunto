class EventPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    user.present?
  end

  def destroy?
    user.present?
  end

  def index?
    user.present?
  end

  def show?
    user.present?
  end

  def new?
    user.present?
  end
end
