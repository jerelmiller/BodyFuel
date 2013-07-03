class CreateFood < ActiveRecord::Migration
  def up
    create_table :food_products do |t|
      t.string :name, null: false
      t.decimal :price, null: false, scale: 2, default: 0
      t.text :description, default: nil
      t.timestamps
    end
  end

  def down
    drop_table :food_products
  end
end
