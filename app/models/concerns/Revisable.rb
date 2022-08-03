module Revisable
    
    extend ActiveSupport::Concern

    included do
        after_save :create_revision
    end

    def description=(value)
        @description = value
    end

    def description
        if self.persisted?
            revision = self.revisions.last
            revision.description if revision
        else
            @description
        end
    end

    def reviser_id=(value)
        @reviser_id = value
    end

    def reviser_id
        revision = self.revisions.last
        revision.user_id if revision
    end

    def reviser
        User.find(self.reviser_id)
    end

    private

    def create_revision
        revisions.create!( 
            description: @description,
            revisable_id: self.id,
            revisable_type: self.class.name,
            user_id: @reviser_id
        )
    end

end
