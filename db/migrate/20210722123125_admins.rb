class Admins < ActiveRecord::Migration[5.2]
  def change
     add_column :chats, :is_admin_sent, :boolean
  end
end
