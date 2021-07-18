class Admin::ChatsController < ApplicationController

  def create
    @chat =Chat.new(chat_params)
    @chat.save
    redirect_to admin_rooms_path(@chat.room_id)
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id, :user_id).merge(admin_id: current_admin.id)
  end

end
