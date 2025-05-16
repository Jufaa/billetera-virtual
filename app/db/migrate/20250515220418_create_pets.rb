class CreatePets < ActiveRecord::Migration[8.0]
  def change
    create_table :pets do |t|
      t.string :pet_number
      t.integer :pet_type
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
