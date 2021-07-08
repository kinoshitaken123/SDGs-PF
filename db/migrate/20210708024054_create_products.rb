class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.integer :genre_id, foreign_key: true
      t.string :name
      t.string :image_id
      t.text :description
      t.integer :price
      t.boolean :status, default: true
      t.timestamps
    end
  end
end
