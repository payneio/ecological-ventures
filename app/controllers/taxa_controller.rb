class TaxaController < ApplicationController
  before_action :set_taxon, only: %i[ show edit update destroy ]

  # GET /taxa or /taxa.json
  def index
    authorize Taxon
    @taxa = Taxon.all
  end

  # GET /taxa/1 or /taxa/1.json
  def show
    authorize @taxon
  end

  # GET /taxa/new
  def new
    authorize Taxon
    @taxon = Taxon.new
  end

  # GET /taxa/1/edit
  def edit
    authorize @taxon
  end

  # POST /taxa or /taxa.json
  def create
    authorize Taxon
    @taxon = Taxon.new(taxon_params)

    respond_to do |format|
      if @taxon.save
        format.html { redirect_to taxon_url(@taxon), notice: "Taxon was successfully created." }
        format.json { render :show, status: :created, location: @taxon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @taxon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /taxa/1 or /taxa/1.json
  def update
    authorize @taxon
    respond_to do |format|
      if @taxon.update(taxon_params)
        format.html { redirect_to taxon_url(@taxon), notice: "Taxon was successfully updated." }
        format.json { render :show, status: :ok, location: @taxon }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @taxon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /taxa/1 or /taxa/1.json
  def destroy
    authorize @taxon
    @taxon.destroy

    respond_to do |format|
      format.html { redirect_to taxa_url, notice: "Taxon was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taxon
      @taxon = Taxon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def taxon_params
      params.require(:taxon).permit(:name, :description, :link, :cover_photo).merge(reviser_id: current_user.id)
    end
end
