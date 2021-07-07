class CreateProductsComments < ActiveRecord::Migration[5.2]
  def change
    create_table :products_comments do |t|

      t.integer :user_id, foreign_key: true
      t.integer :product_id, foreign_key: true
      t.text    :comment

      t.timestamps
    end
  end
end
