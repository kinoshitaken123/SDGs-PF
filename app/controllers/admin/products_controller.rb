class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!

  def create
    @product = Product.new(product_params)
    @product.user_id = current_admin.id
    if @product.save
      redirect_to admin_products_path(@product), notice: '登録を成功しました。'
    else
      @product = Product.new
      @genres = Genre.all
      flash[:danger] = '空欄があります。'
      render 'new'
    end
  end

  def new
    @product = Product.new
    @genres = Genre.all
  end

  def index
    @products = Product.all
    @review = Review.first
  end

  def show
    @product = Product.find(params[:id])
    @product_intax = (@product.price * 1.1).round(2).ceil
  end

  def edit
    @product = Product.find(params[:id])
    @genres  = Genre.all
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_product_path, notice: '登録を成功しました'
    else
      @product = Product.find(params[:id])
      @genres = Genre.all
      flash[:danger] = ' 空欄があります。'
      render 'edit'
    end
  end

  private

  def product_params
    params.require(:product)
          .permit(:name, :description, :price, :genre_id, :status, :image_id, :image, :store)
  end
end
