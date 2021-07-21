class ChangeColumnToReviews < ActiveRecord::Migration[5.2]
  def change
    change_column :reviews, :rate, :float, default: 0
    add_reference :reviews, :product, foreign_key: true
    add_reference :reviews, :user, foreign_key: true
  end
end
