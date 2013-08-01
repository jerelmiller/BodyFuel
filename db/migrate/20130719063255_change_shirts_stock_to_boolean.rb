class ChangeShirtsStockToBoolean < ActiveRecord::Migration
  def up
    remove_column :shirts, :stock
    add_column :shirts, :stock, :boolean, null: false, default: false
  end

  def down
    remove_column :shirts, :stock
    add_column :shirts, :stock, :integer, null: false, default: 0
  end
end
