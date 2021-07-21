class RemoveRateFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :rate, :float
  end
end
