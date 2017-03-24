class FuelsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @fuels = Fuel.search(params)
    @fuel_weekly_max_cap = FuelWeeklyMaxCap.last
  end
  
  def list
    # @fuels = Fuel.all
    @fuels = Fuel.sort_by_state(params)
  end

  def new
    @fuel = Fuel.new
    # @cities = Malaysia.cities['Kuala Lumpur'] # need to be removed
    @brands = ['Shell','Petronas','Petron','Caltex','BHP']
  end

  def create 
    params[:fuel][:user_id] = current_user.id
    @fuel = Fuel.new(params_fuel)
    # validates :state, inclusion: {in: %w(Kuala Lumpur), message: "invalid"}
    if @fuel.save
      redirect_to root_path
    else
      render :new
      @cities = Malaysia.cities['Kuala Lumpur']
    end
  end

  def cities
    @cities = Malaysia.cities[params[:state]]
  end

  private
  def params_fuel
    params.require(:fuel).permit(:area, :state, :brand, :ron_95_price,
      :ron_97_price, :diesel_price, :user_id)
  end

end