class CreateCarts < ActiveRecord::Migration
  def up
    create_table :carts do |t|
      t.decimal :total_price,   null: false, scale: 2, default: 0
    end
  end

  def down
    drop_table :carts
  end
end
