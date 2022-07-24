class AssociationPolicy

  attr_reader :user

  def initialize(user, _record)
    @user = user
  end
  
  def index?
    true
  end

  def add?
    user and user.admin?
  end

  def remove?
    user and user.admin?
  end

end
