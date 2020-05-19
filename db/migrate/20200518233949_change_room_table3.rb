class ChangeRoomTable3 < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :name, :string

    add_column :rooms, :title, :string
    add_index :rooms, :title
  end
end
