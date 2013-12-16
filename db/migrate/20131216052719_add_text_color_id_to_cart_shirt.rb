class AddTextColorIdToCartShirt < ActiveRecord::Migration
  def change
    add_column :cart_shirts, :text_color_id, :integer, default: nil, after: :color_id
    rename_column :cart_shirts, :color_id, :shirt_color_id
  end
end
