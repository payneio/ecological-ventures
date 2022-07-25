class EcoregionsController < ApplicationController
  before_action :set_ecoregion, only: %i[ show ]

  # GET /ecoregions or /ecoregions.json
  def index
    authorize Ecoregion
    @ecoregions = Ecoregion.all.values.sort_by { |ecoregion| ecoregion.id.to_i }
  end

  # GET /ecoregions/1 or /ecoregions/1.json
  def show
    authorize @ecoregion
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ecoregion
      @ecoregion = Ecoregion.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ecoregion_params
      params.require(:ecoregion).permit(:id, :title)
    end
end
