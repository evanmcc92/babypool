class AddWinnerToPools < ActiveRecord::Migration[6.0]
  def change
    add_column :pools, :winner, :boolean
  end
end
