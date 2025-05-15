class CreateAddMoney < ActiveRecord::Migration[8.0]
  def change
    create_table :addmoney do |t|
      t.integer :numeroOp
      t.float :monto
      t.date :fecha_dinero_ingresado
    end
  end
end
