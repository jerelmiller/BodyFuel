class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.string  :name,          null: false
      t.decimal :price,         null: false, scale: 2, default: 0
      t.integer :category_id,   null: false
    end
  end

  def down
    drop_table :products
  end
end
