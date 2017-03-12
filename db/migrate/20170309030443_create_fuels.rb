class CreateFuels < ActiveRecord::Migration[5.0]
  def change
    create_table :fuels do |t|
      t.string :area
      t.string :state
      t.string :brand
      t.monetize :ron_95_price
      t.monetize :ron_97_price
      t.monetize :diesel_price

      t.timestamps
    end
  end
end
