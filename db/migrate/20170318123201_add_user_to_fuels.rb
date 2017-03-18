class AddUserToFuels < ActiveRecord::Migration[5.0]
  def change
    add_column :fuels, :user_id, :integer
  end
end
