class FuelsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :list]
  before_action :authenticate_admin!, only: [:destroy]
  def index
    @fuels = Fuel.search(params)
    @fuel_weekly_max_cap = FuelWeeklyMaxCap.last
  end
  
  def list
    # @fuels = Fuel.all
    @fuels = Fuel.sort_by_state(params)
  end
  
  def adminlist
    # @fuels = Fuel.all
    @fuels = Fuel.sort_by_state(params)
  end
  
  def upvote
    @fuel = Fuel.find(params[:id])
    @fuel.votes.create
    redirect_to(list_fuels_path)
  end
  
  def devote
    @fuel = Fuel.find(params[:id])
    @fuel.votes.first.destroy
    redirect_to(list_fuels_path)
  end
  
  def vote_count
    @fuel = Fuel.find(params[:id])
    @fuel.votes.count
  end
  
  def new
    @fuel = Fuel.new
    # @cities = Malaysia.cities['Kuala Lumpur'] # need to be removed
    @brands = ['All','Shell','Petronas','Petron','Caltex','BHP']
  end

  def create 
    params[:fuel][:user_id] = current_user.id
    @fuel = Fuel.new(params_fuel)
    
    # validates :state, inclusion: {in: %w(Kuala Lumpur), message: "invalid"}
    if @fuel.save
      @fuel.votes.create
      redirect_to root_path
    else
      render :new
      @cities = Malaysia.cities['Kuala Lumpur']
    end
  end

  def cities
    @cities = Malaysia.cities[params[:state]]
  end
  
  def destroy
    @fuel = Fuel.find(params[:id])
    @fuel.destroy
  end

  private
  def params_fuel
    params.require(:fuel).permit(:area, :state, :brand, :ron_95_price,
      :ron_97_price, :diesel_price, :user_id)
  end

end