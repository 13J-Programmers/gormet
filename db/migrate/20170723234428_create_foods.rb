class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.integer :menu_id
      t.integer :order_id
      t.boolean :with_cheese

      t.timestamps
    end
  end
end
