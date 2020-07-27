class CreatePools < ActiveRecord::Migration[6.0]
  def change
    create_table :pools do |t|
      t.string :name
      t.string :email
      t.string :gender
      t.date :birth_date
      t.time :birth_time
      t.integer :length
      t.integer :weight
      t.references :admin, null: false, foreign_key: true
      t.references :baby, null: false, foreign_key: true

      t.timestamps
    end
  end
end
