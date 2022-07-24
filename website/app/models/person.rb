class Person < ApplicationRecord
    has_and_belongs_to_many :ventures
    
    def display_string
        name
    end
end
