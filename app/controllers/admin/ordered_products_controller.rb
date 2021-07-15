class Admin::OrderedProductsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @ordered_product = OrderedProduct.find(params[:id])
    @order = @ordered_product.order
    @ordered_products = OrderedProduct.where(id: @order.id)
    if @ordered_product.update(ordered_product_params)
      #注文ステータスの変更
      @ordered_product.change_status
      redirect_to admin_order_path(@order)
    else
      render 'show'
    end
  end

  private

  def ordered_product_params
    params.require(:ordered_product).permit(:production_status)
  end

end
