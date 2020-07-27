class AddBabyBornToBabies < ActiveRecord::Migration[6.0]
  def change
    add_column :babies, :baby_name, :string
    add_column :babies, :birth_date, :date
    add_column :babies, :birth_time, :time
    add_column :babies, :length, :integer
    add_column :babies, :weight, :integer
    add_column :babies, :is_born, :boolean
  end
end
