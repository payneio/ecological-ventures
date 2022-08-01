class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    user.is_admin
  end

  def show?
    user && (user.is_admin || user.id == record.id)
  end

  def edit?
    user && (user.is_admin  || user.id == record.id)
  end

  def update?
    edit?
  end

end
