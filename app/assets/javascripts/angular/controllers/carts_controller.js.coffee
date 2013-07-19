angular.module('carts_controller', [])
.controller 'CartsCtrl', ($scope, DataSeed, CartProduct) ->
  DataSeed.then (data) ->
    _.extend $scope, data

    $scope.cart_products = []

  $scope.add_product = (shirt) =>
      cart_product = {}
      cart_product.cart_id = $scope.cart.id
      cart_product.product_id = shirt.product_id
      cart_product.price = shirt.price
      cart_product.quantity = shirt.quantity

      CartProduct.save(
        cart_product: cart_product
      )

  $scope.format_price = (price) ->
    price.toFixed(2)