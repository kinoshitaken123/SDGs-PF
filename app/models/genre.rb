class Genre < ApplicationRecord
  has_many :products
  validates :name, presence: true

# 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @genle = Genre.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @genle = Genre.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @genle = Genre.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @genle= Genre.where("name LIKE?","%#{word}%")
    else
      @genle = Genre.all
    end
  end
end
