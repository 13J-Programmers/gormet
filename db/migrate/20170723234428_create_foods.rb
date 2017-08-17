class CreateFoods < ActiveRecord::Migration[5.1]
  def change
    create_table :foods do |t|
      t.integer :menu_id, null: false
      t.integer :order_id, null: false
      # t.boolean :with_cheese, default: false, null: false

      t.timestamps
    end
  end
end
