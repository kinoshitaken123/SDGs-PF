class Public::RoomsController < ApplicationController
  before_action :authenticate_user! # Deviseのログイン確認

  def index
      @chats = Chat.all
      @prouct = Product.find(params[:id])
  end

  def show
      @room = Room.find_or_create_by(id: params[:id])
      @product_id = params[:product_id]
      @chat = Chat.new
      # roomがnilじゃなかったらなおかつuser_room処理を実行
    if !@room.nil? && UserRoom.where(:user_id => current_user.id, :room_id => params[:id]).present?
      @chats = @room.chats
    else
      @user_room = UserRoom.new( {user_id: current_user.id, room_id: @room.id} )
      @user_room.save
    end
  end

end