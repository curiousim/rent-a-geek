class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def add_review?
    true
  end

  def destroy?
    true
  end

  def create?
    true
  end
  def update?
    true
  end
  def destroy?
    true
  end
  def show?
    true
  end
end
