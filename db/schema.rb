# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bonuscard", id: :serial, force: :cascade do |t|
    t.serial "client_id", null: false
    t.integer "balance", null: false
    t.date "creation_date"
    t.index ["client_id"], name: "bonuscard_client_id_key", unique: true
  end

  create_table "bonuslog", id: :serial, force: :cascade do |t|
    t.serial "purchase_id", null: false
    t.serial "bonus_card_id", null: false
    t.integer "balance_change", null: false
    t.datetime "date", precision: nil
  end

  create_table "category", id: :serial, force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.index ["name"], name: "category_name_key", unique: true
  end

  create_table "client", id: :serial, force: :cascade do |t|
    t.string "first_name", limit: 50, null: false
    t.string "surname", limit: 100, null: false
    t.string "patronymic", limit: 50, null: false
    t.date "birth_date"
    t.string "phone_number", limit: 20
    t.string "passport_series", limit: 4, null: false
    t.string "passport_number", limit: 6, null: false
    t.index ["passport_series", "passport_number"], name: "client_passport_series_passport_number_key", unique: true
    t.index ["phone_number"], name: "client_phone_number_key", unique: true
  end

  create_table "product", id: :serial, force: :cascade do |t|
    t.serial "series_id", null: false
    t.serial "category_id", null: false
    t.serial "type_id", null: false
    t.string "name", limit: 100
    t.integer "price"
    t.integer "discount_percent", limit: 2
    t.integer "quantity"
  end

  create_table "purchase", id: :serial, force: :cascade do |t|
    t.serial "seller_id", null: false
    t.serial "client_id", null: false
    t.integer "bonus_amount"
    t.integer "cash_amount"
    t.datetime "date", precision: nil
  end

  create_table "seller", id: :serial, force: :cascade do |t|
    t.string "first_name", limit: 50, null: false
    t.string "surname", limit: 100, null: false
    t.string "patronymic", limit: 50, null: false
    t.date "birth_date"
    t.string "phone_number", limit: 20
    t.string "passport_series", limit: 4, null: false
    t.string "passport_number", limit: 6, null: false
    t.integer "salary"
    t.date "hiring_date", null: false
    t.date "disimiss_date"
    t.index ["passport_series", "passport_number"], name: "seller_passport_series_passport_number_key", unique: true
    t.index ["phone_number"], name: "seller_phone_number_key", unique: true
  end

  create_table "series", id: :serial, force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.index ["name"], name: "series_name_key", unique: true
  end

  create_table "type", id: :serial, force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.index ["name"], name: "type_name_key", unique: true
  end

  create_table "warehouselog", id: :serial, force: :cascade do |t|
    t.serial "product_id", null: false
    t.serial "purchase_id", null: false
    t.string "type", limit: 15, null: false
    t.integer "quantity_change", null: false
    t.integer "amount", null: false
    t.datetime "date", precision: nil
  end

  add_foreign_key "bonuscard", "client", name: "bonuscard_client_id_fkey"
  add_foreign_key "bonuslog", "bonuscard", column: "bonus_card_id", name: "bonuslog_bonus_card_id_fkey"
  add_foreign_key "bonuslog", "purchase", name: "bonuslog_purchase_id_fkey"
  add_foreign_key "product", "category", name: "product_category_id_fkey", on_update: :cascade
  add_foreign_key "product", "series", name: "product_series_id_fkey", on_update: :cascade
  add_foreign_key "product", "type", name: "product_type_id_fkey", on_update: :cascade
  add_foreign_key "purchase", "client", name: "purchase_client_id_fkey", on_update: :cascade
  add_foreign_key "purchase", "seller", name: "purchase_seller_id_fkey", on_update: :cascade
  # add_foreign_key "warehouselog", "purchase", name: "warehouselog_purchase_id_fkey"
end
