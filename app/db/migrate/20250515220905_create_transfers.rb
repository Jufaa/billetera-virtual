class CreateTransfers < ActiveRecord::Migration[8.0]
  def change
     add_column :operations, :numero_transferencia, :integer
     add_column :operations, :monto, :float
     add_column :operations, :fecha_transferencia, :date
     add_column :operations, :tipo_movimiento, :integer
     add_column :operations, :numero_cuenta_destino, :integer
  end
end
