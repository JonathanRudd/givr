class ItemPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    true
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
    record.user == user
  end

  def edit?
    update?
  end

  def update?
    record.user == user
  end

  def my_items?
    true
  end
end
