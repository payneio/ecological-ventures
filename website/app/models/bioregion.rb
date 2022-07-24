class Bioregion < ApplicationRecord
    belongs_to :subrealm
    has_one :realm, through: :subrealm
    has_and_belongs_to_many :ecoregions
    has_and_belongs_to_many :taxa
    has_and_belongs_to_many :ventures
    has_and_belongs_to_many :problems

    has_many_attached :hero_images do |attachable|
        attachable.variant :thumb, resize_to_limit: [100, 100]
    end
end
