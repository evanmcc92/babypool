class CreateBabies < ActiveRecord::Migration[6.0]
  def change
    create_table :babies do |t|
      t.string :title
      t.date :due_date
      t.text :description
      t.text :links
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
