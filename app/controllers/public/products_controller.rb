class Public::ProductsController < ApplicationController

  def top
    @products = Product.all.order(created_at: :asc)  #:asc,古い順
    @genres = Genre.all
  end

  def about
  end

  def index
    @genres = Genre.all
    @products = Product.where(status: true)
  end

  def show
    @products = Product.all
    @product =  Product.find(params[:id])
    @products_comment = ProductsComment.new
    @cart_item = CartItem.new
  end
  
  require 'payjp'

  def purchase
    Payjp.api_key = "秘密鍵"
    Payjp::Charge.create(
      amount: 1100, # 決済する値段
      card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
      currency: 'jpy'
    )
  end

  private

  def product_params
      params.require(:product).permit(:name, :image, :description, :price, :genre_id, :status)
  end
end
