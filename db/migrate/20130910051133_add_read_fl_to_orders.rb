class AddReadFlToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :read_fl, :boolean, null: false, default: false
  end
end
