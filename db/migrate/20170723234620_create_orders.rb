class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.datetime :order_at
      t.datetime :offer_at

      t.timestamps
    end
  end
end
