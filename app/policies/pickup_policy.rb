class PickupPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope = scope.joins(:item)
      scope.where(user: user).or(scope.where(items: {user_id: user.id}))
    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def index?
    true
  end

  def destroy?
    record.item.user == user || record.user == user
  end

  def edit?
    update?
  end

  def update?
    record.item.user == user || record.user == user
  end
end
