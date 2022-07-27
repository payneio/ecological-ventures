class Role < ApplicationRecord
  belongs_to :user
  belongs_to :roleable, polymorphic: true

  # scope :with_role, ->(role){ 
  #   joins(sick_registation: :user).where(user:{name: name}) +
  #   joins(time_registation: :user).where(user:{name: name})
  # }

  scope :with_role, ->(role) { where("role = ?", role) }
  
end
