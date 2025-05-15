class CreatePets < ActiveRecord::Migration[8.0]
  def change
    create_table :pets do |t|
      t.string :nro_mascota
      t.integer :tipo_mascota
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
