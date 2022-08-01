class Venture < ApplicationRecord
    has_and_belongs_to_many :people
    has_and_belongs_to_many :taxa
    has_and_belongs_to_many :ecoregions
    has_and_belongs_to_many :bioregions
    has_and_belongs_to_many :subrealms
    has_and_belongs_to_many :realms
    has_and_belongs_to_many :problems
    has_and_belongs_to_many :solutions

    has_many :revisions, as: :revisable
    include Revisable

    def display_string
        name
    end
end
