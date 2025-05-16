class CreateCards < ActiveRecord::Migration[8.0]
  def change
    create_table :cards do |t|
      t.integer :card_number
      t.date :expiration_date
      t.string :owner_name
      t.string :owner_lastname
      t.string :associated_bank
      t.integer :card_type
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
