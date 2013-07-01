class CreateOrders < ActiveRecord::Migration
  def up
    create_table :orders do |t|
      t.string  :order_number,    null: false
      t.integer :customer_id,     null: false
      t.integer :cart_id,         null: false
      t.decimal :total,           null: false, scale: 2, default: 0
    end
  end

  def down
    drop_table :orders
  end
end
