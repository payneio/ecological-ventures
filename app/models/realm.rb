class Realm < ApplicationRecord
    has_many :subrealms
    has_and_belongs_to_many :taxa
    has_and_belongs_to_many :ventures
    has_and_belongs_to_many :problems

    has_one_attached :hero_image

    has_many :revisions, as: :revisable
    include Revisable

    def display_string
        title
    end
end
