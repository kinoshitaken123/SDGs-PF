class Admin::RoomsController < ApplicationController

  def index
    @chats = Chat.all
    # @chat = Chat.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @room = Room.find_by(params[:id])
    # roomがnilではなかったらなおかつuser_room処理を実行
    if UserRoom.where(:room_id => @room.id).present?
     @chat = Chat.new
     @chats = @room.chats
    else
      redirect_back(fallback_location: root_path)
    end

  end

end