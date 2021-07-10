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
end
