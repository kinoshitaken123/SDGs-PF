class Product < ApplicationRecord
  belongs_to :genre
  belongs_to :user, optional: true
  has_many :cart_items
  attachment :image
  has_many :products_comments, dependent: :destroy
end