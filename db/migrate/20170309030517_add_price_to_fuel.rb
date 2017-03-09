class AddPriceToFuel < ActiveRecord::Migration[5.0]
  def change
    add_money :fuels, :ron_95_price
    add_money :fuels, :ron_97_price
    add_money :fuels, :diesel_price
  end
end
