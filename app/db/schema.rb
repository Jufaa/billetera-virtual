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

ActiveRecord::Schema[8.0].define(version: 2025_05_15_221932) do
  create_table "accounts", force: :cascade do |t|
    t.string "nro_cuenta"
    t.string "cbu"
    t.string "alias"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "deposite_money", force: :cascade do |t|
    t.integer "numeroOp"
    t.float "monto"
    t.date "fecha_dinero_ingresado"
  end

  create_table "cards", force: :cascade do |t|
    t.integer "nro_tarjeta"
    t.date "fecha_vencimiento"
    t.string "nombre_titular"
    t.string "apellido_titular"
    t.string "banco_asociado"
    t.integer "tipo_tarjeta"
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_cards_on_account_id"
  end

  create_table "operations", force: :cascade do |t|
    t.string "type"
    t.integer "account_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "numero_transferencia"
    t.float "monto"
    t.date "fecha_transferencia"
    t.integer "tipo_movimiento"
    t.integer "numero_cuenta_destino"
    t.float "monto_prestado"
    t.float "monto_a_pagar"
    t.date "fecha_vencimiento"
    t.integer "estado_prestamo"
    t.index ["account_id"], name: "index_operations_on_account_id"
  end

  create_table "pets", force: :cascade do |t|
    t.string "nro_mascota"
    t.integer "tipo_mascota"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nombre"
    t.string "apellido"
    t.string "cuit"
    t.date "fecha_nacimiento"
    t.string "direccion"
    t.string "celular"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accounts", "users"
  add_foreign_key "cards", "accounts"
  add_foreign_key "operations", "accounts"
  add_foreign_key "pets", "users"
end
