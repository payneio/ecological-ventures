class RevisionsController < ApplicationController

    before_action :set_revisable, except: [:revert]
    before_action :set_revision, except: [:index]

    def index
        authorize Revision
        @revisions = @revisable.revisions.order(created_at: :desc)
    end

    def show
        authorize @revisable
        eval("@#{@revisable_path} = @revisable")
        render "#{@revisable_path.pluralize}/show"
    end

    def revert
        authorize @revision
        revisable_params = {
            description: @revision.description,
            user_id: current_user.id
        }
        respond_to do |format|
          if @revision.revisable.update(revisable_params)
            format.html { redirect_to polymorphic_url([@revision.revisable, @revision]), notice: "#{@revision.revisable.class.name} was successfully reverted." }
            format.json { render :show, status: :ok, location: @revision.revisable }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: @revision.revisable.errors, status: :unprocessable_entity }
          end
        end
    end

    private

    def set_revisable
        @revisable_param = params.keys.find {|key| key.include? "_id" }
        @revisable_param = params[:id] if !@revisable_param
        @revisable_path = @revisable_param.split('_').first
        @revisable_class = @revisable_path.capitalize.constantize
        @revisable = @revisable_class.find(params[@revisable_param.to_sym])
    end

    def set_revision
        @revision = Revision.find(params[:id])
    end

end
