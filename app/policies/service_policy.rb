class ServicePolicy < ApplicationPolicy
  def create?
    done_by_owner
  end

  def update?
    done_by_owner
  end

  def destroy?
    done_by_owner
  end

  private
  def done_by_owner
    user.present? && record.organization == user
  end
end
