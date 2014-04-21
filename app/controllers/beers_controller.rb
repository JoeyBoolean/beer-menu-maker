require 'brewerydb'

class BeersController < ApplicationController
  
  @beer_data = []

  before_action :user_signed_in, only: [:create, :edit, :update, :destroy] 
  before_action :set_beer, only: [:show, :edit, :update, :destroy]


  # GET /beers
  # GET /beers.json

  def get_beer_data()
    @beer_data
  end

  def set_beer_list(data)
    @beer_data = data
  end

  def index
    @beers = Beer.limit(10)
    beer_list = []
    @beers.each { |a| beer_list.push(a.beer_id)}
    data = BreweryDb.get_beers_by_ids(beer_list)
    set_beer_list(data)
    i = 0
    @beers.each do |b| 
      data.each do |d|
        if d["id"] == b.beer_id
          b.set_beer_info(d)
        end
      end
      
    end

  end

  # GET /beers/1
  # GET /beers/1.json
  def show
    puts @beer.beer_id
    data = BreweryDb.get_beer_by_id(@beer.beer_id)
    @beer.set_beer_info(data)
  end

  # POST /beers/search
  def search
    search = params["q"]
    puts search
    @data = nil
    if search
      search = search.chomp
      search = search.gsub(/[ ]/, "+")
      @data = BreweryDb.search_beer(search)
    end
  end



  # GET /beers/new
  def new
    @beer = Beer.new
  end

  # GET /beers/1/edit
  def edit
  end

  # POST /beers
  # POST /beers.json
  def create
    @beer = Beer.new(beer_params)
    puts @beer
    respond_to do |format|
      if @beer.save
        format.html { redirect_to beers_path, notice: 'Beer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @beer }
      else
        format.html { render action: 'new' }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /beers/1
  # PATCH/PUT /beers/1.json
  def update
    respond_to do |format|
      if @beer.update(beer_params)
        format.html { redirect_to @beer, notice: 'Beer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /beers/1
  # DELETE /beers/1.json
  def destroy
    @beer.destroy
    respond_to do |format|
      format.html { redirect_to beers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beer
      @beer = @beer || Beer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def beer_params
      params.require(:beer).permit(:beer_id)
      #params
    end

    def search_params
      params.require(:q).permit(:q)
    end

    def user_signed_in
      redirect_to signin_url, notice: "Please Sign In." unless signed_in?
    end
end
