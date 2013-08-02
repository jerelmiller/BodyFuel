class CartShirt < ActiveRecord::Base
  belongs_to :cart
  belongs_to :shirt
  belongs_to :color
  belongs_to :size

  attr_accessible :cart_id,
                  :shirt_id,
                  :price,
                  :quantity,
                  :size_id,
                  :color_id

  def self.checked_attributes
    [:cart_id, :shirt_id, :size_id, :color_id]
  end

  def total
    price * quantity
  end
end