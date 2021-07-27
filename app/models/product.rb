class Product < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items
  attachment :image
  has_many :products_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_products, through: :favorites, source: :board

  belongs_to :genre
  has_many :reviews, dependent: :destroy
  # validates :rate, numericality: {
  #   less_than_or_equal_to: 5,
  #   greater_than_or_equal_to: 1}, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # 検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      Product.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      Product.where("name LIKE?", "#{word}%")
    elsif search == "backward_match"
      Product.where("name LIKE?", "%#{word}")
    elsif search == "partial_match"
      Product.where("name LIKE?", "%#{word}%")
    else
      Product.all
    end
  end
end
