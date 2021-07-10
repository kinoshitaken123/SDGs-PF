class Product < ApplicationRecord
  belongs_to :genre
  has_many :cart_items
  attachment :image
  has_many :products_comments, dependent: :destroy
end