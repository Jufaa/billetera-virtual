class CreateTransfers < ActiveRecord::Migration[8.0]
  def change
     add_column :operations, :transfer_number, :integer
     add_column :operations, :amount, :integer
     add_column :operations, :transfer_date, :date
     add_column :operations, :movement_type, :integer
     add_column :operations, :destiny_account_number, :integer
  end
end
