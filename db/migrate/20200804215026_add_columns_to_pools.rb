class AddColumnsToPools < ActiveRecord::Migration[6.0]
  def change
    add_column :pools, :birth_date_points, :integer
    add_column :pools, :birth_time_points, :integer
    add_column :pools, :birth_weight_points, :integer
    add_column :pools, :birth_length_points, :integer
  end
end
