class CreatePaymentCards < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_cards do |t|
  
      t.timestamps
    end
  end
end
