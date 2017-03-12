class CreateFuelWeeklyMaxCaps < ActiveRecord::Migration[5.0]
  def change
    create_table :fuel_weekly_max_caps do |t|
      t.monetize :max_ron_95_price
      t.monetize :max_ron_97_price
      t.monetize :max_diesel_price

      t.timestamps
    end
  end
end
