class Order < ApplicationRecord
  belongs_to :user
  has_many :ordered_products, dependent: :destroy

  enum payment_method: { "クレジットカード": 0, "現地支払い": 1 }
   enum starus: { "入金待ち": 0,"入金確認": 1 }

  def change_production_status
    if self.status == "入金待ち"
      self.ordered_products.update_all(production_status: :着手不可)
    elsif self.status == "入金確認"
      self.ordered_products.update_all(production_status: :製作待ち)
    end
  end
end
