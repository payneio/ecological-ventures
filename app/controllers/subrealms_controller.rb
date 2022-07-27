class SubrealmsController < ApplicationController

    before_action :set_subrealm, only: %i[ show ]

    def index
        authorize Subrealm
        @subrealms = Subrealm.all
    end

    def show
        authorize Subrealm
    end

    private

    def set_subrealm
        @subrealm = Subrealm.find(params[:id])
    end
    
end
