class Admin::ChatsController < ApplicationController
  def create
    if @chat = Chat.new(chat_params)
      @chat.save!
      redirect_to admin_rooms_path(@chat.room_id)
      flash[:success] = "メッセージを送信しました。"
    else
      flash[:danger] = '空欄があります。'
      render 'new'
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:message, :room_id, :user_id).merge(admin_id: current_admin.id, is_admin_sent: true)
    # byebug
  end
end
