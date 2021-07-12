class CreateChat < ActiveRecord::Migration[5.2]
  def change
    create_table :chats do |t|
      t.references :user
    end
  end
end
