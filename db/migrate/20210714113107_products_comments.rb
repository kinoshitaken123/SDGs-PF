class ProductsComments < ActiveRecord::Migration[5.2]
  def change
    add_column :products_comments, :user_id, :integer
  end
end
