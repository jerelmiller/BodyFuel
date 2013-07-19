class ChangeShirtsStockToBoolean < ActiveRecord::Migration
  def up
    change_column :shirts, :stock, :boolean, null: false, default: false
  end

  def down
  end
end
