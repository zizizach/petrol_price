class FuelsController < ApplicationController
   def index
       
       @query = Fuel.ransack(params[:query])
       @fuels = @query.result(distinct: true)
   end
   
   def new
       @fuel = Fuel.new
   end
   
   def create
       @fuel = Fuel.new(params_fuel)
       if @fuel.save
           redirect_to fuels_path
           notice[:flash] = 'Your price has been saved. Thank you.'
       else
           render :new
       end
   end
   
   def cities
      @cities = Malaysia.cities[params[:state]]
      puts @cities
   end
   
   private
   def params_fuel
       params.require(:fuel).permit(:area, :state, :brand, :ron_95_price, :ron_97_price, :diesel_price)
   end
end