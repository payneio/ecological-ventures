class Ecoregion < ApplicationRecord
    has_and_belongs_to_many :bioregions
    has_and_belongs_to_many :taxa
    has_and_belongs_to_many :ventures
    has_and_belongs_to_many :problems

    has_many_attached :hero_images do |attachable|
        attachable.variant :thumb, resize_to_limit: [100, 100]
    end

    def display_string
        title
    end
end
