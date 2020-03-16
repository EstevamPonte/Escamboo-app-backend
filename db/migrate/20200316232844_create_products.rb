class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.text :description
      t.integer :escamboos, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
