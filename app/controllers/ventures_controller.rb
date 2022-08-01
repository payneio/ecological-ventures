class VenturesController < ApplicationController

  before_action :set_venture, only: %i[ show edit update destroy ]

  # GET /ventures or /ventures.json
  def index
    authorize Venture
    @ventures = Venture.all.sort_by(&:name)
    @featured_venture = Venture.find(1)
    @recommended_ventures = @ventures.excluding(@featured_venture).sample(3)
    @popular_ventures = @ventures.first(6)
  end

  # GET /ventures/1 or /ventures/1.json
  def show
    authorize @venture
  end

  # GET /ventures/new
  def new
    authorize Venture
    @venture = Venture.new
  end

  # GET /ventures/1/edit
  def edit
    authorize @venture
  end

  # POST /ventures or /ventures.json
  def create
    authorize Venture
    @venture = Venture.new(venture_params)

    respond_to do |format|
      if @venture.save
        format.html { redirect_to venture_url(@venture), notice: "Venture was successfully created." }
        format.json { render :show, status: :created, location: @venture }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @venture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ventures/1 or /ventures/1.json
  def update
    authorize @venture
    respond_to do |format|
      if @venture.update(venture_params.merge(user_id: current_user.id))
        format.html { redirect_to venture_url(@venture), notice: "Venture was successfully updated." }
        format.json { render :show, status: :ok, location: @venture }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @venture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ventures/1 or /ventures/1.json
  def destroy
    authorize @venture
    @venture.destroy

    respond_to do |format|
      format.html { redirect_to ventures_url, notice: "Venture was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venture
      @venture = Venture.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def venture_params
      params.require(:venture).permit(:name, :summary, :description, :logo, :cover_photo, :org_size, :year_started, :status, :labels, :link, :discord, :youtube)
    end
end
