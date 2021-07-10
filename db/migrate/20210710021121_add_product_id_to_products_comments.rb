class AddProductIdToProductsComments < ActiveRecord::Migration[5.2]
  def change
    add_column :products_comments, :product_id, :integer
  end
end
