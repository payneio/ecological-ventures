class BioregionsController < ApplicationController

    before_action :set_bioregion, only: %i[ show ]

    def index
        authorize Bioregion
        @bioregions = Bioregion.all
    end

    def show
        authorize Bioregion
    end

    private

    def set_bioregion
        @bioregion = Bioregion.find(params[:id])
    end
    

end
