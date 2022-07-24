class Subrealm < ApplicationRecord
    belongs_to :realm
    has_many :bioregions
    has_and_belongs_to_many :taxa
    has_and_belongs_to_many :ventures
    has_and_belongs_to_many :problems

    has_one_attached :hero_image
end
