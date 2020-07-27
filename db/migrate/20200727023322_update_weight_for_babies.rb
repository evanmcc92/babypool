class UpdateWeightForBabies < ActiveRecord::Migration[6.0]
  def change
    change_column :babies, :weight, :decimal
    change_column :pools, :weight, :decimal
  end
end
