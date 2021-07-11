class RemoveAdminIdFromChats < ActiveRecord::Migration[5.2]
  def change
    remove_column :chats, :room_id_id, :integer
    remove_column :chats, :user_id_id, :integer
    remove_column :chats, :admin_id_id, :integer
  end
end
