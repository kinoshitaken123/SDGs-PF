class CreateOrderedProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :ordered_products do |t|
      
      t.integer :order_id, foreign_key: true
      t.integer :product_id, foreign_key: true
      t.integer :quantity
      t.integer :production_status, default: 0
      t.integer :purchase_price
      
      t.timestamps
    end
  end
end
