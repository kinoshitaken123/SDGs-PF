class RemoveAdminIdFromChats < ActiveRecord::Migration[5.2]
  def change
    remove_reference :chats, :room_id, foreign_key: true
    remove_reference :chats, :user_id, foreign_key: true
    remove_reference :chats, :admin_id, foreign_key: true
  end
end
