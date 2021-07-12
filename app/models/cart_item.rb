class CartItem < ApplicationRecord

  belongs_to :product
  belongs_to :user

  validates :user_id, :product_id, :quantity, presence: true
	validates :quantity, numericality: { only_integer: true }
end
