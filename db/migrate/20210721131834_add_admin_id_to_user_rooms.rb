class AddAdminIdToUserRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :user_rooms, :admin_id, :integer
  end
end
