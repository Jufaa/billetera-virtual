class CreatePets < ActiveRecord::Migration[8.0]
  def change
    create_table :pets do |t|
      t.integer :pet_number
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
