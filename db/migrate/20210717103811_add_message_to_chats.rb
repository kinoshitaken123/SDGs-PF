class AddMessageToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :message, :text
    add_column :chats, :room_id, :integer
    add_column :chats, :admin_id, :integer
  end
end
