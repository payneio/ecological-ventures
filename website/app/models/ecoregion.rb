class Ecoregion < ApplicationRecord
    has_and_belongs_to_many :bioregions
    has_many_attached :hero_images do |attachable|
        attachable.variant :thumb, resize_to_limit: [100, 100]
    end
end
