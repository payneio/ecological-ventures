class Problem < ApplicationRecord

    has_and_belongs_to_many :ecoregions
    has_and_belongs_to_many :bioregions
    has_and_belongs_to_many :subrealms
    has_and_belongs_to_many :realms
    has_and_belongs_to_many :ventures
    has_and_belongs_to_many :solutions

    has_many :revisions, as: :revisable
    include Revisable

    def display_string
        name
    end

end
