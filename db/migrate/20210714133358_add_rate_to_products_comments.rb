class AddRateToProductsComments < ActiveRecord::Migration[5.2]
  def change
    add_column :products_comments, :rate, :float
  end
end
