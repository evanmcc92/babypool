class UpdateBabiesTable < ActiveRecord::Migration[6.0]
  def change
    add_column :babies, :end_date, :date
    add_column :babies, :gender, :string
    add_column :babies, :payment_link, :string
    add_column :babies, :registry_link, :string
    remove_column :babies, :links, :string
  end
end
