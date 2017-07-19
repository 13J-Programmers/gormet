class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :name
      t.integer :amount
      t.integer :stock
      t.boolean :with_cheese

      t.timestamps
    end
  end
end
