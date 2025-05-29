class CreateAccounts < ActiveRecord::Migration[8.0]
  def change
     create_table :accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :cvu
      t.string :alias
      t.integer :balance
      t.timestamps
     end
  end
end
