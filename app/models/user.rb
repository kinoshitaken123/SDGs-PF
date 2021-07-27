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

  # DM機能
  has_many :chats, dependent: :destroy
  has_many :user_rooms, dependent: :destroy
  has_many :rooms, through: :user_rooms

  has_many :favorites, dependent: :destroy
  has_many :favorite_products, through: :favorites, source: :product
  has_many :chats, dependent: :destroy
  has_many :orders
  has_many :reviews
  has_many :admins

  validates :first_name, :last_name, :kana_first_name, :kana_last_name,
            :phone_number, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone_number, numericality: { only_integer: true }

  # パスワードなしで登録情報を更新する機能
  # def update_without_current_password(params, *options)
  #   params.delete(:current_password)

  #   if params[:password].blank? && params[:password_confirmation].blank?
  #     params.delete(:password)
  #     params.delete(:password_confirmation)
  #   end

  #   result = update_attributes(params, *options)
  #   clean_up_passwords
  #   result
  #

  def self.guest
    find_or_create_by!(email: 'aaa@aaa.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.password_confirmation = user.password
      user.first_name = '太郎'
      user.last_name = 'テスト'
      user.kana_first_name = 'タロウ'
      user.kana_last_name = 'テスト'
      user.phone_number = '09012345678'
      user.save
    end
  end
end
