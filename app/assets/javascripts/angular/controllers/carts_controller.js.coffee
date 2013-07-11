angular.module('carts_controller', [])
.controller 'CartsCtrl', ($scope, DataSeed) ->
  DataSeed.then (data) ->
    _.extend $scope, data

    $scope.cart_products ||= []

  # $scope.cart_has_product = (product) =>
  #     _.some($scope.cart_products, (cp) =>
  #       cp.product_id == product.id)

  $scope.add_product = (product) =>
      # return if $scope.cart_has_product(product)

      cart_product = {}
      cart_product.cart_id = $scope.cart.id
      # cart_product.product_id = product.id
      # cart_product.unit_price = product.unit_price
      # cart_product.unit_cost = product.unit_cost
      cart_product.quantity = 1
      $scope.cart_products.push cart_product

  $scope.format_price = (price) ->
    price.toFixed(2)