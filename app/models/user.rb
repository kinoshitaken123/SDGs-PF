class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cart_items, dependent: :destroy
  has_many :products_comments, dependent: :destroy
  has_many :products, dependent: :destroy
  #DM機能
  has_many :chats, dependent: :destroy
  has_many :user_roomss, dependent: :destroy
  has_many :rooms, through: :user_rooms

  has_many :favorites, dependent: :destroy
  has_many :favorite_products, through: :favorites, source: :product

  has_many :orders
  
  def favorited_by?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
  
end




  # def favorite_by?(customer)
  #   favorites.where(customer_id: customer.id).exists?
  # end
