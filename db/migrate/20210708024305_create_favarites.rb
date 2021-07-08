class CreateFavarites < ActiveRecord::Migration[5.2]
  def change
    create_table :favarites do |t|

      t.timestamps
    end
  end
end
