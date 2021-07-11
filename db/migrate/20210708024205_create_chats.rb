class CreateChats < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.references :room_id
      t.references  :user_id
      t.references :admin_id

      t.timestamps
    end
  end
end
