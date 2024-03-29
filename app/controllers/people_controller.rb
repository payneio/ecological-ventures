class PeopleController < ApplicationController
  before_action :set_person, only: %i[ show edit update destroy claim unclaim ]

  # GET /people or /people.json
  def index
    authorize Person

    if params[:q]
      q = params[:q].downcase.strip
      if q.empty?
        @people = []       
      else
        @people = Person.where("name ILIKE ?", "%#{q}%").first(10)
      end
    else
      @people = Person.all
    end  
  end

  # GET /people/1 or /people/1.json
  def show
    authorize @person
  end

  # GET /people/new
  def new
    authorize Person
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
    authorize @person
  end

  # POST /people or /people.json
  def create
    authorize Person
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to person_url(@person), notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    authorize @person

    respond_to do |format|
      if @person.update(person_params.merge(user_id: current_user.id))
        format.html { redirect_to person_url(@person), notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    authorize @person
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def claim
    authorize @person
    @person.claim(current_user)
    redirect_to person_url(@person)
  end

  def unclaim
    authorize @person
    @person.unclaim
    redirect_to person_url(@person)
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def person_params
    params.require(:person).permit(:name, :phone, :email, :linkedin, :facebook, :website, :address, :country, :portrait, :avatar, :description, :interests, :is_public).merge(reviser_id: current_user.id)
  end

  def get_venture
    @venture = Venture.find(params[:venture_id])
  end

end
