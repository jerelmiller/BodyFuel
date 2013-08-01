class AddPriceToCartShirts < ActiveRecord::Migration
  def change
    add_column :cart_shirts, :price, :decimal, scale: 2, null: false, default: 0, precision: 6, after: :shirt_id
  end
end
