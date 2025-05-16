class DepositeMoney < ActiveRecord::Migration[8.0]
  def change
    create_table :deposite_money do |t|
      t.integer :numeroOp
      t.float :monto
      t.date :fecha_dinero_ingresado
    end
  end
end
