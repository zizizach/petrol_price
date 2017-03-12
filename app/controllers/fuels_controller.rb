class FuelsController < ApplicationController
  def index
    @fuels = Fuel.search(params)
    @fuel_weekly_max_cap = FuelWeeklyMaxCap.last
  end

  def new
    @fuel = Fuel.new
    # @cities = Malaysia.cities['Kuala Lumpur'] # need to be removed
    @brands = ['Shell','Petronas','Petron','Caltex','BHP']
  end

  def create 
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
      :ron_97_price, :diesel_price)
  end

end