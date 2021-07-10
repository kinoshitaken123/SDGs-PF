class AddCommentToProductsComments < ActiveRecord::Migration[5.2]
  def change
    add_column :products_comments, :comment, :text
  end
end
