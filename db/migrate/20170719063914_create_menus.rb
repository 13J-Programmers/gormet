class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :name, null: false
      t.integer :amount, null: false
      t.integer :stock, null: false
      t.boolean :with_cheese, default: false
      t.integer :order_id

      t.timestamps
    end
  end
end
