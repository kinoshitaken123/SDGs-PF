class Public::CartItemsController < ApplicationController
  include ApplicationHelper

  before_action :set_cart_item, only: [:update, :destroy]
  before_action :authenticate_user!

  def create
    @cart_item = current_customer.cart_items.new(params_cart_item)
    # カートの中に同じ商品がある場合は数だけ追加する
    @update_cart_item = CartItem.find_by(product: @cart_item.product)
      if @update_cart_item.present? && @cart_item.valid?
        @cart_item.quantity = @update_cart_item.quantity
        @update_cart_item.destroy
      end

    if @cart_item.save
      redirect_to cart_items_path
    else
      flash[:alert] = "個数を選択してください"
      render "public/products/show"
    end
  end

  def index
    @cart_items = current_user.cart_items
  end

  def update
    @cart_item.update(quantity: params[:cart_item][:quantity].to_i)
    @cart_items = current_user.cart_items
    @price = subtotal(@cart_item).to_s(:delimited)
    @total = product_total_price(@cart_items).to_s(:delimited)
  end

  def destroy
    @cart_item.destroy
    @cart_items = current_user.cart_items
    @total = product_total_price(@cart_items).to_s(:delimited)
  end

  def destroy_all
    @cart_items = current_user.cart_items
    @cart_items.destroy_all
    redirect_to public_cart_items_path, success: "カート内を全て削除しました"
  end

  private

  def params_cart_item
    params.require(:cart_item).permit(:quantity, :product_id)
  end

end