class RevisionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def revert?
    user.admin?
  end

end
