class CreateCartProducts < ActiveRecord::Migration
  def up
    create_table :cart_products do |t|
      t.integer :cart_id,     null: false
      t.integer :product_id,  null: false
      t.decimal :price,       null: false, scale: 6, default: 0
      t.integer :quantity,    null: false, default: 0
    end
  end

  def down
    drop_table :cart_products
  end
end
