class AddFirstNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :kana_first_name, :string
    add_column :users, :kana_last_name, :string
    add_column :users, :phone_number, :string
  end
end
