class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :dni
      t.date :birth_date
      t.string :email
      t.string :phone_number
      t.string :password
      t.integer :credits, default: 0
      t.integer :main_pet_number
      t.datetime :created_at, null: false
      t.datetime :updated_at, null: false
    end
  end
end
