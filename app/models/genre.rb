class Genre < ApplicationRecord
  has_many :products
  validates :name, presence: true

  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      Genre.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      Genre.where("name LIKE?", "#{word}%")
    elsif search == "backward_match"
      Genre.where("name LIKE?", "%#{word}")
    elsif search == "partial_match"
      Genre.where("name LIKE?", "%#{word}%")
    else
      Genre.all
    end
  end
end
