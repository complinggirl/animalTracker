class SightingsController < ApplicationController
  before_action :set_sighting, only: [:show, :edit, :update, :destroy]

  # GET /sightings
  # GET /sightings.json
  def index
    @temp = params[:sightings]
    # puts "***********!!!!!!!!!!!!!!************"
    # puts @temp
    # puts "***********!!!!!!!!!!!!!!************"
    @start = @temp[:start_date]
    @finish = @temp[:end_date]
    @reg = @temp[:reg]
    @foo = Sighting.all
    puts "***********!!!!!!!!!!!!!!************"
    # @foo.each  do |x|
    #   puts x.region.name
    # end
      puts "***********!!!!!!!!!!!!!!************"


    @sightings = []
    @temp = Sighting.where(:date => @start..@finish)
    @temp.each do |sighting|
      if sighting.region.name == @reg
        @sightings << sighting
      end
    end

  end

  # GET /sightings/1
  # GET /sightings/1.json
  def show
    @sighting = Sighting.find(params[:id])
  end

  # GET /sightings/new
  def new
    @animal = Animal.find(params[:animal_id])
    @sighting = @animal.sightings.new

  end

  # GET /sightings/1/edit
  def edit
    @sighting = Sighting.find(params[:id])
    @animal = @sighting.animal
  end

  # POST /sightings
  # POST /sightings.json
  def create
    @animal = Animal.find(params[:animal_id])
    @sighting = Sighting.new(params[:sighting].merge({:animal_id => params[:animal_id]}))
    @sighting.save
    respond_to do |format|
      if @sighting.save
        format.html { redirect_to @sighting, notice: 'Sighting was successfully created.' }
        format.json { render :show, status: :created, location: @sighting }
      else
        format.html { render :new }
        format.json { render json: @sighting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sightings/1
  # PATCH/PUT /sightings/1.json
  def update
    respond_to do |format|
      if @sighting.update(sighting_params)
        format.html { redirect_to @sighting, notice: 'Sighting was successfully updated.' }
        format.json { render :show, status: :ok, location: @sighting }
      else
        format.html { render :edit }
        format.json { render json: @sighting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sightings/1
  # DELETE /sightings/1.json
  def destroy
    @animal = @sighting.animal
    @sighting.destroy
    respond_to do |format|
      format.html { render :destroy, notice: 'Sighting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sighting
      @sighting = Sighting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sighting_params
      params.require(:sighting).permit(:longitude, :latitude, :date, :date)
    end
end
