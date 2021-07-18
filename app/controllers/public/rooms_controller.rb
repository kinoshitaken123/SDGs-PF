class Public::RoomsController < ApplicationController
  before_action :authenticate_user! # Deviseのログイン確認

  def index
    @chats = Chat.all
    @prouct = Product.find(params[:id])
  end

  def show
    @room = Room.find_by(params[:id])
      @chat =Chat.new
    if !@room.nil? && UserRoom.where(:user_id => current_user.id, :room_id => params[:id]).present? #roomがnilzyなかったらなおかつuser_room処理を実行
      @chats = @room.chats
    else
      @user_room = UserRoom.new({user_id: current_user.id, room_id: Room.create.id})
      @user_room.save
    end
  end

end