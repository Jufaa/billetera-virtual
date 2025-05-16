class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :lastname
      t.string :cuit
      t.date :birth_date
      t.string :address
      t.string :phone_number

      t.timestamps
    end
  end
end
