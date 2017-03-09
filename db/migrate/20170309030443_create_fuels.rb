class CreateFuels < ActiveRecord::Migration[5.0]
  def change
    create_table :fuels do |t|
      t.string :area
      t.string :state
      t.string :brand

      t.timestamps
    end
  end
end
