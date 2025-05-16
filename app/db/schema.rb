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

ActiveRecord::Schema[8.0].define(version: 2025_05_16_133131) do
  create_table "accounts", force: :cascade do |t|
    t.string "account_number"
    t.string "cbu"
    t.string "alias"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "cards", force: :cascade do |t|
    t.integer "card_number"
    t.date "expiration_date"
    t.string "owner_name"
    t.string "owner_lastname"
    t.string "associated_bank"
    t.integer "card_type"
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_cards_on_account_id"
  end

  create_table "deposite_money", force: :cascade do |t|
    t.integer "operation_number"
    t.integer "amount"
    t.date "date_money_deposited"
  end

  create_table "operations", force: :cascade do |t|
    t.string "type"
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "transfer_number"
    t.integer "amount"
    t.date "transfer_date"
    t.integer "movement_type"
    t.integer "destiny_account_number"
    t.integer "given_amount"
    t.integer "total_amount"
    t.date "expiration_date"
    t.integer "loan_state"
    t.index ["account_id"], name: "index_operations_on_account_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "pet_number"
    t.integer "pet_type"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "lastname"
    t.string "cuit"
    t.date "birth_date"
    t.string "address"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "cards", "accounts"
  add_foreign_key "operations", "accounts"
  add_foreign_key "pets", "users"
end
