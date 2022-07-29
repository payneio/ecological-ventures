class PersonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    @user
  end
  
  def update?
    @user && (@user.admin? || @user == @record.claimant)
  end

  def destroy?
    @user && (@user.admin? || @user == @record.claimant)
  end

  def claim?
    @user && !@user.person
  end

  def unclaim?
    @user && @user.admin?
  end

end
