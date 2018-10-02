class CreateRentals < ActiveRecord::Migration[5.1]
  def change
    create_table :rentals do |t|
      t.string :titre
      t.string :surface
      t.string :price
      t.string :photos
      t.string :localisation
      t.text :description
      t.boolean :top, default: false, null: false
      t.boolean :visible, default: false, null:false
      t.string :pictures
      t.timestamps
    end
  end
end
