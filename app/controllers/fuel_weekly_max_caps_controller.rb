class FuelWeeklyMaxCapsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @fuel_weekly_max_cap = FuelWeeklyMaxCap.last
  end

  def new
    @fuel_weekly_max_cap = FuelWeeklyMaxCap.new
  end

  def create
    @fuel_weekly_max_cap = FuelWeeklyMaxCap.new(params_fuel_weekly_max_cap)
    if @fuel_weekly_max_cap.save
      redirect_to fuel_weekly_max_caps_path
    else
      render :new
    end
  end

  def edit
    @fuel_weekly_max_cap = FuelWeeklyMaxCap.last
  end

  def update
    @fuel_weekly_max_cap = FuelWeeklyMaxCap.last
    # @fuel_weekly_max_cap = FuelWeeklyMaxCap.update
    if @fuel_weekly_max_cap.update_attributes(params_fuel_weekly_max_cap)
      redirect_to fuel_weekly_max_caps_path
    else
      render :edit
    end

  end

  private 
  def params_fuel_weekly_max_cap
    params.require(:fuel_weekly_max_cap).permit(:max_ron_95_price,
      :max_ron_97_price, :max_diesel_price)
  end

end