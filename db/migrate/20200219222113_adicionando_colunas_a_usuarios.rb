class AdicionandoColunasAUsuarios < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.integer :escamboos, default: 0
      t.integer :phone
      t.string :city, null: false, default: ""
    end
  end
end
