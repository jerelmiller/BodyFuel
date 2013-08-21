class RemoveTotalFromOrders < ActiveRecord::Migration
  def up
    remove_column :orders, :total
  end

  def down
  end
end
