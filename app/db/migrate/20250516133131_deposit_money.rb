class DepositMoney < ActiveRecord::Migration[8.0]
  def change
    create_table :deposit_money do |t|
      t.integer :operation_number
      t.integer :amount
      t.date :date_money_deposited
    end
  end
end
