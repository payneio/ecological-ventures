class EcosystemsController < ApplicationController
  before_action :set_ecosystem, only: %i[ show edit update destroy ]

  # GET /ecosystems or /ecosystems.json
  def index
    @ecosystems = Ecosystem.all
  end

  # GET /ecosystems/1 or /ecosystems/1.json
  def show
  end

  # GET /ecosystems/new
  def new
    @ecosystem = Ecosystem.new
  end

  # GET /ecosystems/1/edit
  def edit
  end

  # POST /ecosystems or /ecosystems.json
  def create
    @ecosystem = Ecosystem.new(ecosystem_params)

    respond_to do |format|
      if @ecosystem.save
        format.html { redirect_to ecosystem_url(@ecosystem), notice: "Ecosystem was successfully created." }
        format.json { render :show, status: :created, location: @ecosystem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ecosystem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ecosystems/1 or /ecosystems/1.json
  def update
    respond_to do |format|
      if @ecosystem.update(ecosystem_params)
        format.html { redirect_to ecosystem_url(@ecosystem), notice: "Ecosystem was successfully updated." }
        format.json { render :show, status: :ok, location: @ecosystem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ecosystem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ecosystems/1 or /ecosystems/1.json
  def destroy
    @ecosystem.destroy

    respond_to do |format|
      format.html { redirect_to ecosystems_url, notice: "Ecosystem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ecosystem
      @ecosystem = Ecosystem.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ecosystem_params
      params.require(:ecosystem).permit(:name, :description, :link, :cover_photo)
    end
end
