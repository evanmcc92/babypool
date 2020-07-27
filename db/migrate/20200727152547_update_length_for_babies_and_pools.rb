class UpdateLengthForBabiesAndPools < ActiveRecord::Migration[6.0]
  def change
    change_column :babies, :length, :float
    change_column :pools, :length, :float
  end
end
