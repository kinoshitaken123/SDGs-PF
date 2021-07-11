class AddAdminIdToChats < ActiveRecord::Migration[5.2]
  def change
    add_reference :chats, :room_id, foreign_key: true
    add_reference :chats, :user_id, foreign_key: true
    add_reference :chats, :admin_id, foreign_key: true
  end
end
