class VenturesController < ApplicationController
  before_action :set_venture, only: %i[ show edit update destroy ]

  # GET /ventures or /ventures.json
  def index
    @ventures = Venture.all.sort_by(&:name)
    @featured_venture = Venture.find(1)
    @recommended_ventures = @ventures.excluding(@featured_venture).sample(3)
    @popular_ventures = @ventures.first(6)
  end

  # GET /ventures/1 or /ventures/1.json
  def show
    @labels = @venture.labels.split(';').map{ |x| x.strip }
  end

  # GET /ventures/new
  def new
    @venture = Venture.new
  end

  # GET /ventures/1/edit
  def edit
  end

  # POST /ventures or /ventures.json
  def create
    @venture = Venture.new(venture_params)
    associate_people(params[:person][:people_ids])

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
    associate_people(params[:person][:people_ids])
    respond_to do |format|
      if @venture.update(venture_params)
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

def associate_people(people_ids)
  people_ids.each do |person_id|
    unless person_id.empty?
      person = Person.find(person_id)
      @venture.people << person
    end
  end
end