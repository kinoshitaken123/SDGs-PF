class CreateProductsComments < ActiveRecord::Migration[5.2]
  def change
    create_table :products_comments do |t|
      t.float :rate, null: false, default: 0
      t.timestamps
    end
  end
end
