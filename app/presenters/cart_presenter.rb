class CartPresenter < BasePresenter
  presents :cart

  def num_products
    return 'Cart ({{ cart.cart_shirts.length }})' if content_for? :angular_controller
    "Cart (#{cart.cart_shirts.length})"
  end

  def total
    return '{{ cart.total | currency }}' if content_for? :angular_controller
    number_to_currency cart.total
  end
end