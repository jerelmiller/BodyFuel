angular.module('carts_controller', [])
.controller 'CartsCtrl', ($scope, $timeout, DataSeed, CartShirt, ShirtDesign) ->
  DataSeed.then (data) ->
    _.extend $scope, data

    angular.forEach $scope.shirts, (shirt) -> shirt.loading = true
    $timeout ->
      angular.forEach $scope.shirts, (shirt) ->
        ShirtDesign.design id: shirt.id, style: 'order'
        , (response) ->
          shirt.design = response.design
          shirt.loading = false
        , (response) -> shirt.loading = false
    , 200

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
      cart_shirt.shirt_color_id = shirt.shirt_color_id
      cart_shirt.text_color_id = shirt.text_color_id

      $scope.cart.cart_shirts.push cart_shirt
      $scope.clearShirtParams shirt
      CartShirt.save
        cart_shirt: cart_shirt
        authenticity_token: $scope.authenticity_token
      , (cart) ->
        shirt.saving = false
        $scope.success(cart)

  $scope.success = (cart) -> $scope.cart = cart

  $scope.hide_shirt_alert = (shirt, alert) ->
    delete $scope.errors[shirt.id][alert]
    Utils.adjustTileSize '.tiles-4'

  $scope.is_valid_shirt = (shirt) -> !$scope.has_errors_for_shirt(shirt)
  $scope.reset_errors_for_shirt = (shirt) -> $scope.errors[shirt.id] = {}
  $scope.has_errors_for_shirt = (shirt) -> !_.isEmpty $scope.errors[shirt.id]

  $scope.validate_shirt = (shirt) ->
    $scope.errors[shirt.id].quantity = 'Quantity must be greater than 0' if parseInt(shirt.quantity) < 1
    $scope.errors[shirt.id].quantity = 'Quantity must be a number' unless _isValidNumber(shirt.quantity)
    $scope.errors[shirt.id].shirt_color = 'Invalid color for shirt' unless _.contains _.map(shirt.shirt_colors, (color) -> color.id), shirt.shirt_color_id
    $scope.errors[shirt.id].shirt_color = 'You must select a color' if _.isUndefined shirt.shirt_color_id
    $scope.errors[shirt.id].text_color = 'Invalid color for shirt' unless _.contains _.map(shirt.text_colors, (color) -> color.id), shirt.text_color_id
    $scope.errors[shirt.id].text_color = 'You must select a color' if _.isUndefined shirt.text_color_id
    $scope.errors[shirt.id].size = 'Invalid size for shirt' unless _.contains _.map(shirt.sizes, (size) -> size.id), shirt.size_id
    $scope.errors[shirt.id].size = 'You must select a size' if _.isUndefined shirt.size_id

  $scope.clearShirtParams = (shirt) ->
    delete shirt.size_id
    delete shirt.shirt_color_id
    delete shirt.text_color_id
    delete shirt.quantity

  _isValidNumber = (num) ->
    _.isNumber(parseFloat(num)) && !isNaN(parseFloat(num))