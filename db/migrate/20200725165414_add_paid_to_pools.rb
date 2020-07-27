class AddPaidToPools < ActiveRecord::Migration[6.0]
  def change
    add_column :pools, :paid, :boolean
  end
end
