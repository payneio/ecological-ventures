class Subrealm < ApplicationRecord
    belongs_to :realm
    has_many :bioregions
    has_one_attached :hero_image
end
