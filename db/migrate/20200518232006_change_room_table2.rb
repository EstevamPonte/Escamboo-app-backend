class ChangeRoomTable2 < ActiveRecord::Migration[5.2]
  def change
    remove_column :rooms, :idUser1, :integer
    remove_column :rooms, :idUser2, :integer

    add_column :rooms, :idUser1_id, :integer
    add_column :rooms, :idUser2_id, :integer
  end
end
