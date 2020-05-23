class ChangeColumnsName < ActiveRecord::Migration[5.2]
  def change
    rename_column :rooms, :idUser1_id, :iduser1_id
    rename_column :rooms, :idUser2_id, :iduser2_id
  end
end
