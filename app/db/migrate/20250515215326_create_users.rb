class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :apellido
      t.string :cuit
      t.date :fecha_nacimiento
      t.string :direccion
      t.string :celular

      t.timestamps
    end
  end
end
