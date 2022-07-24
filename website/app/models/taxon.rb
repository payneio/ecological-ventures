class Taxon < ApplicationRecord
    has_and_belongs_to_many :ventures
    has_and_belongs_to_many :problems
    has_and_belongs_to_many :ecoregions
    has_and_belongs_to_many :bioregions
    has_and_belongs_to_many :subrealms
    has_and_belongs_to_many :realms
end
