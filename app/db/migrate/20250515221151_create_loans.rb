class CreateLoans < ActiveRecord::Migration[8.0]
  def change
    add_column :operations, :monto_prestado, :float
    add_column :operations, :monto_a_pagar, :float
    add_column :operations, :fecha_vencimiento, :date
    add_column :operations, :estado_prestamo, :integer
  end
end
