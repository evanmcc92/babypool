class AddScoreToPools < ActiveRecord::Migration[6.0]
  def change
    add_column :pools, :score, :integer
  end
end
