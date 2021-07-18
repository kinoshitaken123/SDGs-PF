class Public::RoomsController < ApplicationController
  before_action :authenticate_user! # Deviseのログイン確認

  def index
    @chats = Chat.all
    @prouct = Product.find(params[:id])

  end

  def show
    @room = Room.find_by(params[:id])
    if !@room.nil? && UserRoom.where(:user_id => current_user.id, :room_id => @room.id).present? #roomがnilzyなかったらなおかつuser_room処理を実行
      @chat =Chat.new
      @chats = @room.chats
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def create
    if params[:user_id].to_i == current_user.id
      redirect_back(fallback_location: root_path)
    else
      @room = Room.create
      UserRoom.create(:room_id => @room.id, :user_id => current_user.id)
      UserRoom.create(:room_id => @room.id, :user_id => params[:user_id])
      redirect_to public_rooms_path
    end
  end

end