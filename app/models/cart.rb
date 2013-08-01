class Cart < ActiveRecord::Base
  has_many :cart_shirts

  def total
    cart_shirts.map(&:total).reduce(:+) || 0
  end

end