class ChangeRoomTable < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :idUser1, :integer
    add_column :rooms, :idUser2, :integer
  end
end
