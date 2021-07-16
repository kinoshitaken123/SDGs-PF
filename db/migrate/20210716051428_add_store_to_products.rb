class AddStoreToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :store, :string
  end
end
