class Public::OrdersController < ApplicationController
  include ApplicationHelper
  before_action :authenticate_user!

  def new
    @cart_items = current_user.cart_items
    @order = Order.new
  end

  def check
    @cart_items = current_user.cart_items
    @order = Order.new(user: current_user, payment_method: params[:order][:payment_method])
    @order.total_price = billing(@order)
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.save
    redirect_to complete_public_orders_path, success: "注文を登録しました"

    # total_priceに請求額を代入する
    @order.total_price = billing(@order)

    # カート商品の情報を注文商品に移動する
    @cart_items = current_user.cart_items

    @cart_items.each do |cart_item|
      OrderedProduct.create!(product: cart_item.product, order: @order, quantity: cart_item.quantity, purchase_price: subtotal(cart_item))
    end
    @cart_items.destroy_all
  end

  def complete
  end

  def index
    @orders = current_user.orders
  end

  def show
    @order = Order.find(params[:id])
    @ordered_products = @order.ordered_products
  end

  private

  def order_params
    params.require(:order).permit(:name, :payment_method, :total_price)
  end
end
