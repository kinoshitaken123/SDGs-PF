class Admin::RoomsController < ApplicationController
  before_action :set_room, only: :show

  def index
    @chats = Chat.all
    #@chat = Chat.find(params[:id])
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

end