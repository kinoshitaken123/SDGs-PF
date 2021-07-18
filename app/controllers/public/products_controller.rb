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
  end

  def show
    @products = Product.all
    @product =  Product.find(params[:id])
    @products_comment = ProductsComment.new
    @cart_item = CartItem.new

    product_user_room_ids = UserRoom.where(user_id: @product_user_id).pluck('room_id')
    login_user_room_ids = UserRoom.where(user_id: current_user.id).pluck('room_id')
    if (product_user_room_ids - login_user_room_ids).size == product_user_room_ids.size
      @user_room = user_room.find_by(room_id: (produt_user_room_ids + login_user_room_ids) - (produt_user_room_ids + login_user_room_ids).uniq)
    else
      @user_room = UserRoom.new({user_id: @product.user_id, room_id: Room.create.id})
      @user_room.save
      user_room = UserRoom.new({user_id: current_user.id, room_id: @user_room.room_id})
      user_room.save
    end
  end

  private

  def product_params
      params.require(:product).permit(:name, :image, :description, :price, :genre_id, :status)
  end
end
