class DropFoodProductsAndProducts < ActiveRecord::Migration
  def up
    drop_table :products
    drop_table :food_products
    drop_table :food_items
  end

  def down
  end
end
