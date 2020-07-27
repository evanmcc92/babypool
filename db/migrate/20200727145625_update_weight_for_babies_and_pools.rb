class UpdateWeightForBabiesAndPools < ActiveRecord::Migration[6.0]
  def change
    change_column :babies, :weight, :float
    change_column :pools, :weight, :float
  end
end
