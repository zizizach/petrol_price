class AddVoteToFuels < ActiveRecord::Migration[5.0]
  def change
    add_column :fuels, :vote, :integer
  end
end
