class Public::ProductsController < UserBaseController

  def top
    @products = Product.all.order(created_at: :asc)  #:asc,古い順
    @genres = Genre.all
    @stores = Store.all
  end

  def about
  end

  def index
    @genres = Genre.all
    @products = Product.where(status: true)
    @stores = Store.all
  end

  def show
    @products = Product.all
    @product =  Product.find(params[:id])
    @products_comment = ProductsComment.new
    @cart_item = CartItem.new
  end

  private

  def product_params
      params.require(:product).permit(:name, :image, :description, :price, :genre_id, :status)
  end
end
