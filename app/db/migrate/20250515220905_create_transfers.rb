class CreateTransfers < ActiveRecord::Migration[8.0]
  def change
    create_table :transfers do |t|
      t.integer :amount
      t.integer :destiny_account_cvu
      t.date :transfer_date
      t.references :account, null: false, foreign_key: true
      t.timestamps
    end
  end
end
