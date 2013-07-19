class RecreateCartProducts < ActiveRecord::Migration
  def up
    drop_table :cart_products
    create_table :cart_shirts do |t|
      t.integer :cart_id,     null: false
      t.integer :shirt_id,    null: false
      t.integer :quantity,    null: false, default: 0
      t.integer :color_id,    null: false
      t.integer :size_id,     null: false
      t.timestamps
    end
  end

  def down
  end
end
