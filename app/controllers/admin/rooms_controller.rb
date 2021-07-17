class Admin::RoomsController < ApplicationController

  def create
      chat = Chat.new(chats_params)
    if chat.save
      redirect_to admin_rooms_path,success: 'メッセージを送信しました'
    else
      redirect_to admin_rooms_path,alert: 'メッセージを送信できませんでした'
    end
  end

  def index
  end

  def show
    @room = Room.find(params[:id])
    if UserRoom.where(:user_id => current_user.id, :room_id => @room.id).present?
      @chats = @room.chats
      @chat =Chat.new
    else
      redirect_back(fallback_location: root_path)
    end
  end
  
  private
  
  def chat_params
    params.require(:chat).permit(:message, :room_id).merge(admin_id: current_admin.id)
  end

end
