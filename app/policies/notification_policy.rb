class NotificationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def new?
    true
  end
  def create?
    true
  end
  def update?
    true
  end

  def update_seen_redirect?
    true
  end
end
