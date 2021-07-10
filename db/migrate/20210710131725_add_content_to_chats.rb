class AddContentToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :content, :text
  end
end
