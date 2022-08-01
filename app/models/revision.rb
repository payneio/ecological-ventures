class Revision < ApplicationRecord
  belongs_to :revisable, polymorphic: true
  belongs_to :user
end
