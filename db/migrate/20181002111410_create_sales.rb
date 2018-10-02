class CreateSales < ActiveRecord::Migration[5.1]
  def change
    create_table :sales do |t|
      t.string :titre
      t.string :localisation
      t.string :surface
      t.string :price
      t.string :photo
      t.text :description
      t.boolean :top, default: false, null: false
      t.boolean :visible, default: false, null:false
      t.string :photos
      t.timestamps
    end
  end
end
