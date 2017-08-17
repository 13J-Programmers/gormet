class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.integer :stock, null: false

      t.timestamps
    end
  end
end
