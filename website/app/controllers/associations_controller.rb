class AssociationsController < ApplicationController

    layout false

    # GET /associations?q=<something>&a=venture&a_id=123&b=people
    def index

        @a = params["a"] # e.g. ventures
        @a_id = params[:a_id] # e.g. 123
        @b = params[:b] # people
        b_class = @b.classify.constantize # e.g. Person

        skip_authorization

        if params[:query]
            q = params[:query].downcase.strip
            if q.empty?
                results = []       
            else
                results = b_class.where("name ILIKE ?", "%#{q}%").first(10)
            end
        else
            results = b_class.all.first(10)
        end

        @results = results # e.g. a collection of people
    end

    def add_association        
        skip_authorization # fixme
        a = params[:a] # e.g. ventures
        a_id = params[:a_id]
        entity = a.classify.constantize.find(a_id) # e.g. @venture
        b = params[:b] # people
        b_ids = params[:b_ids]
        b_ids = [b_ids] unless b_ids.kind_of?(Array)
        b_class = b.classify.constantize # e.g. Person

        b_ids.each do |b_id|
            entity.public_send(b) << b_class.find(b_id)
        end
        render partial: "shared/association_badges", locals: {
            entities_name: b,
            entities: entity.public_send(b),
            a: a,
            a_id: a_id,
        }
    end

    def remove_association
        skip_authorization # fixme

        # e.g. @venture.people.delete(@person)
        a = params[:a] # e.g. ventures
        a_id = params[:a_id]
        entity = a.classify.constantize.find(a_id) # e.g. @venture
        b = params[:b] # people
        b_ids = params[:b_ids]
        b_ids = [b_ids] unless b_ids.kind_of?(Array)
        b_class = b.classify.constantize # e.g. Person

        b_ids.each do |b_id|
            entity.public_send(b).delete(b_class.find(b_id))
        end

        render partial: "shared/association_badges", locals: {
            entities_name: b,
            entities: entity.public_send(b),
            a: a,
            a_id: a_id,
        }
    end

    private

    def association_params
        params.permit(:a, :a_id, :b, :q)
    end

end
