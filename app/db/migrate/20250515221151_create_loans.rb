class CreateLoans < ActiveRecord::Migration[8.0]
  def change
    add_column :operations, :given_amount, :float
    add_column :operations, :total_amount, :float
    add_column :operations, :expiration_date, :date
    add_column :operations, :loan_state, :integer
  end
end
