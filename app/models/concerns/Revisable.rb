module Revisable
    
    extend ActiveSupport::Concern

    def description
        revision = revisions.last
        revision.description if revision
    end

    def update(params)
        revision_params = { 
            user_id: params[:user_id],
            revisable_id: params[:id],
            revisable_type: name,
            description: params[:description]
        }
        revisions.create(revision_params)
        super(params.except(:description).except(:user_id))
    end

end
