class OrderedProduct < ApplicationRecord

  belongs_to :order
	belongs_to :product

	enum production_status: { "売り切れ": 0, "在庫わずか": 1,"販売中":2 }

  def change_status
    products = self.order.ordered_products
    if self.production_status == "在庫わずか"
      self.order.update(status: "xxxx")
    elsif products.pluck(:production_status).all?{ |status| status == "xxxx"}
      self.order.update(status: "xxxx")
    end
  end

end
