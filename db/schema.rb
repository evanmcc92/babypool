# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_04_215026) do

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "babies", force: :cascade do |t|
    t.string "title"
    t.date "due_date"
    t.text "description"
    t.integer "admin_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "end_date"
    t.string "gender"
    t.string "payment_link"
    t.string "registry_link"
    t.string "baby_name"
    t.date "birth_date"
    t.time "birth_time"
    t.float "length"
    t.float "weight"
    t.boolean "is_born"
    t.index ["admin_id"], name: "index_babies_on_admin_id"
  end

  create_table "pools", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "gender"
    t.date "birth_date"
    t.time "birth_time"
    t.float "length"
    t.float "weight"
    t.integer "admin_id", null: false
    t.integer "baby_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "paid"
    t.integer "score"
    t.boolean "winner"
    t.integer "birth_date_points"
    t.integer "birth_time_points"
    t.integer "birth_weight_points"
    t.integer "birth_length_points"
    t.index ["admin_id"], name: "index_pools_on_admin_id"
    t.index ["baby_id"], name: "index_pools_on_baby_id"
  end

  add_foreign_key "babies", "admins"
  add_foreign_key "pools", "admins"
  add_foreign_key "pools", "babies"
end
