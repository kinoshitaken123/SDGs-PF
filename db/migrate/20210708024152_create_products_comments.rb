class CreateProductsComments < ActiveRecord::Migration[5.2]
  def change
    create_table :products_comments do |t|

      t.timestamps
    end
  end
end
