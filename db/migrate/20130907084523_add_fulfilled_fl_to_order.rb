class AddFulfilledFlToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :fulfilled_fl, :boolean, null: false, default: false
  end
end
