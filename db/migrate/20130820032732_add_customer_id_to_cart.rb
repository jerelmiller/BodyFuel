class AddCustomerIdToCart < ActiveRecord::Migration
  def change
    add_column :carts, :customer_id, :integer, default: nil, after: :total_price
  end
end
