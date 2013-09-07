angular.module('carts_controller', [])
.controller 'CartsCtrl', ($scope, DataSeed, CartShirt) ->
  DataSeed.then (data) ->
    _.extend $scope, data

    $scope.errors = {}

  $scope.add_shirt = (shirt) =>
    $scope.reset_errors_for_shirt shirt
    $scope.validate_shirt shirt
    Utils.adjustTileSize '.tiles-4'

    if $scope.is_valid_shirt shirt
      shirt.saving = true

      cart_shirt = {}
      cart_shirt.cart_id = $scope.cart.id
      cart_shirt.shirt_id = shirt.id
      cart_shirt.price = shirt.price
      cart_shirt.quantity = shirt.quantity
      cart_shirt.size_id = shirt.size_id
      cart_shirt.color_id = shirt.color_id

      $scope.cart.cart_shirts.push cart_shirt
      CartShirt.save
        cart_shirt: cart_shirt
      , (cart) ->
        shirt.saving = false
        $scope.success(cart)

  $scope.success = (cart) ->
    $scope.cart = cart

  $scope.hide_shirt_alert = (shirt, alert) ->
    delete $scope.errors[shirt.id][alert]
    Utils.adjustTileSize '.tiles-4'

  $scope.is_valid_shirt = (shirt) ->
    !$scope.has_errors_for_shirt(shirt)

  $scope.reset_errors_for_shirt = (shirt) ->
    $scope.errors[shirt.id] = {}

  $scope.has_errors_for_shirt = (shirt) ->
    !_.isEmpty $scope.errors[shirt.id]

  $scope.validate_shirt = (shirt) ->
    $scope.errors[shirt.id].quantity = 'Quantity must be greater than 0' if parseInt(shirt.quantity) < 1
    $scope.errors[shirt.id].quantity = 'Quantity must be a number' unless _isValidNumber(shirt.quantity)
    $scope.errors[shirt.id].color = 'Invalid color for shirt' unless _.contains _.map(shirt.colors, (color) -> color.id), shirt.color_id
    $scope.errors[shirt.id].color = 'You must select a color' if _.isUndefined shirt.color_id
    $scope.errors[shirt.id].size = 'Invalid size for shirt' unless _.contains _.map(shirt.sizes, (size) -> size.id), shirt.size_id
    $scope.errors[shirt.id].size = 'You must select a size' if _.isUndefined shirt.size_id

  _isValidNumber = (num) ->
    _.isNumber(parseFloat(num)) && !isNaN(parseFloat(num))