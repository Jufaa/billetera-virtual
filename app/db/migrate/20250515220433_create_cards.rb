class CreateCards < ActiveRecord::Migration[8.0]
  def change
    create_table :cards do |t|
      t.integer :nro_tarjeta
      t.date :fecha_vencimiento
      t.string :nombre_titular
      t.string :apellido_titular
      t.string :banco_asociado
      t.integer :tipo_tarjeta
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
