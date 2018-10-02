class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.string :image
      t.integer :sale_id
      t.timestamps
    end
  end
end
