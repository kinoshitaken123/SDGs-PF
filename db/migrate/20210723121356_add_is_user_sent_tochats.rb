class AddIsUserSentTochats < ActiveRecord::Migration[5.2]
  def change
     add_column :chats, :is_user_sent, :boolean
  end
end
