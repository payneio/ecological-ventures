class Person < ApplicationRecord

    has_and_belongs_to_many :ventures
    has_many :roles, as: :roleable
    has_many :users, through: :roles

    validate :has_one_claimant?
    
    def display_string
        name
    end

    def claimant
        role = roles.with_role("claimant").first
        role.user if role
    end

    def claim(user)
        roles.create(role: "claimant", user_id: user.id, set_by: user.id)
    end

    def unclaim
        roles.with_role("claimant").destroy_all
    end

    private

    def has_one_claimant?
        if roles.with_role("claimant").count > 1
            errors.add(:claimant, "can only have one claimant")
        end
    end

end
