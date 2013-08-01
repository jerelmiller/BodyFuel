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

  def total
    price * quantity
  end
end