class CartShirt < ActiveRecord::Base
  belongs_to :cart
  belongs_to :shirt
  belongs_to :shirt_color
  belongs_to :text_color
  belongs_to :size

  attr_accessible :cart_id,
                  :shirt_id,
                  :price,
                  :quantity,
                  :size_id,
                  :shirt_color_id,
                  :text_color_id

  delegate :name,
           :deleted?,
           to: :shirt

  validates :cart_id, :shirt_id, :quantity, :shirt_color_id, :text_color_id, :size_id, presence: true

  def self.checked_attributes
    [:cart_id, :shirt_id, :size_id, :shirt_color_id, :text_color_id, :quantity]
  end

  def total
    price * quantity
  end
end