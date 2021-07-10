class RemoveContentFromChats < ActiveRecord::Migration[5.2]
  def change
    remove_column :chats, :content, :text
  end
end
