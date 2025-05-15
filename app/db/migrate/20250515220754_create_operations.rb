class CreateOperations < ActiveRecord::Migration[8.0]
  def change
     create_table :operations do |t|
      t.string :type # ingresardinero, transferencia, prestamo
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end 