module ApplicationHelper
  # 税込の計算
  # floorは小数点切り捨て
  def tax_price(price)
    (price * 1.1).floor
  end

  # 小計の計算
  def subtotal(sub)
    (tax_price(sub.product.price) * sub.quantity)
  end

   # 商品合計金額の計算
  def product_total_price(products)
    price = 0
    products.each do |product|
      price  +=  subtotal(product)
    end
    return price
  end

   # 請求額の計算
  def billing(order)
    @cart_items = current_customer.cart_items
    product_total_price(@cart_items) + order.postage
  end
end
