class GeekPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all.order(created_at: :desc)
    end
  end

  def show?
    return true
  end

  def create?
    return true
  end
end
