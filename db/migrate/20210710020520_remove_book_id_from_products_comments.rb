class RemoveBookIdFromProductsComments < ActiveRecord::Migration[5.2]
  def change
    remove_column :products_comments, :book_id, :integer
  end
end
