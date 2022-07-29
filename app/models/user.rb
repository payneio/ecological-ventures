class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable, :lockable

  has_many :roles

  def admin?
    is_admin
  end
  
  def person
    roles.where(roleable_type: "Person").first.tap{|r| r.roleable if r}
  end

end
