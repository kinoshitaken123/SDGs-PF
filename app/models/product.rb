class Product < ApplicationRecord
  belongs_to :genre
  belongs_to :user, optional: true
  has_many :cart_items
  attachment :image
  has_many :products_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_products, through: :favorites, source: :board
    def favorited_by?(user)
     favorites.where(user_id: user.id).exists?
   end

end

 
