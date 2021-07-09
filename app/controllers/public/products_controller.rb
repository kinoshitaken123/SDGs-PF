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
  end

  private

  def product_params
      params.require(:product).permit(:name, :image, :description, :price, :genre_id, :status)
  end
end
