class Solution < ApplicationRecord
    has_and_belongs_to_many :ventures
    has_and_belongs_to_many :problems

    has_many :revisions, as: :revisable
    include Revisable
 
    def display_string
        name
    end


end
