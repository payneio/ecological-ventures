class RealmsController < ApplicationController

    before_action :set_realm, only: %i[ show ]

    def index
        authorize Realm
        @realm = Realm.all
    end

    def show
        authorize Realm
    end

    private

    def set_realm
        @realm = Realm.find(params[:id])
    end
    
end
