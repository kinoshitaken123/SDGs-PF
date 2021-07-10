class AddNameToRooms < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :name, :string
  end
end
