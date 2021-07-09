class Product < ApplicationRecord
  belongs_to :genre
  attachment :image
  validates :genre_id, presence: true
end
