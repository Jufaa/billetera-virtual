class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
     create_table :accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :cvu
      t.string :account_alias
      t.integer :balance
      t.integer :credits
      t.timestamps
     end
  end
end
