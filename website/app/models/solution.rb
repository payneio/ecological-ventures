class Solution < ApplicationRecord
    has_and_belongs_to_many :ventures
    has_and_belongs_to_many :problems

    def display_string
        name
    end
end
