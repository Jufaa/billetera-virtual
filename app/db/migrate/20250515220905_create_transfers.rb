class CreateTransfers < ActiveRecord::Migration[8.0]
  def change
    create_table :transfers do |t|
      t.integer :amount
      t.string :name
      t.string :lastname
      t.string :destiny_account_cvu
      t.datetime :transfer_date
      t.references :account, null: false, index: true,foreign_key: true
      t.timestamps
    end
  end
end
