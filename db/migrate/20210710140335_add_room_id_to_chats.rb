class AddRoomIdToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :room_id, :references
    add_column :chats, :user_id, :references
    add_column :chats, :admin_id, :references
    add_column :chats, :message, :text
  end
end
