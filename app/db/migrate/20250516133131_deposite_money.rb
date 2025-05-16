class DepositeMoney < ActiveRecord::Migration[8.0]
  def change
    create_table :deposite_money do |t|
      t.integer :operation_number
      t.float :amount
      t.date :date_money_deposited
    end
  end
end
