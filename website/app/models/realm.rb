class Realm < ApplicationRecord
    has_many :subrealms
    has_one_attached :hero_image
end
