json.(cart,
  :id
)

json.total cart.total
json.num_cart_shirts cart.cart_shirts.map(&:quantity).reduce(:+)
json.cart_shirts do
  json.partial! 'cart_shirts/cart_shirts', cart_shirts: cart.cart_shirts
end