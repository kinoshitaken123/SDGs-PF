class Public::ChatsController < ApplicationController
  before_action :authenticate_user!

  def create
    # filtered_params = chat_params
    @chat = Chat.new(chat_params)
    # room = Chat.find_by_room_id(filtered_params["room_id"])
    # @chat.admin_id = room.admin_id if room
    redirect_to public_room_path(@chat.room_id)
  end

  private

  def chat_params
    params.require(:chat)
          .permit(:message, :room_id, :user_id, :admin_id)
          .merge(user_id: current_user.id, is_user_sent: true)
  end
end
