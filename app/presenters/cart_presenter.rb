class CartPresenter < BasePresenter
  presents :cart

  def num_products
    return '{{ cart.num_cart_shirts | pluralize:"item" }}' if content_for? :angular_controller
    "#{cart.cart_shirts.length} items"
  end

  def total
    return '{{ cart.total | currency }}' if content_for? :angular_controller
    number_to_currency cart.total
  end
end