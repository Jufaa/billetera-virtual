class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
     create_table :accounts do |t|
      t.string :account_number
      t.string :cbu
      t.string :alias
      t.references :user, null: false, foreign_key: true

      t.timestamps
     end
  end
end
