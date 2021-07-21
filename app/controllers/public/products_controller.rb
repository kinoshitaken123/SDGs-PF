class Public::ProductsController < UserBaseController

  def create
    Review.create(product_id: params[:product_id], rate: params[:price], user_id: current_user.id)
    redirect_to public_product_path(params[:product_id])
  end

  def top
    @products = Product.all.order(created_at: :asc)  #:asc,古い順
    @genres = Genre.all
  end

  def about
  end

  def index
    @genres = Genre.all
    @products = Product.where(status: true)
    @products = Product.where(status: true).page(params[:page]).per(8)
  end

  def show
    @products = Product.all
    @product =  Product.find(params[:id])
    @products_comment = ProductsComment.new
    @cart_item = CartItem.new

    # product_user_room_ids = UserRoom.where(admin_id: @product.user_id).pluck('room_id')
    # login_user_room_ids = UserRoom.where(user_id: current_user.id).pluck('room_id')
    room_id = UserRoom.find_by(admin_id: @product.user_id, user_id: current_user.id)
    # binding.irb
    unless room_id.nil?
      @user_room = room_id
    else
      @user_room = UserRoom.new({admin_id: @product.user_id, user_id: current_user.id, room_id: Room.create.id})
      @user_room.save
      # @user_room = UserRoom.new({user_id: current_user.id, room_id: Room.create.id})
      # @user_room.save
    end
  end

  private

  def product_params
      params.require(:product).permit(:name, :image, :description, :price, :genre_id, :status)
  end
end
