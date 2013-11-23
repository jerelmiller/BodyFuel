angular.module('cart_payment_controller', ['stripe'])
.controller 'CartPaymentCtrl', ($scope, dollarsToCentsFilter, DataSeed, Order, StripeKey) ->
  DataSeed.then (data) ->
    _.extend $scope, data

  $scope.stripe_checkout = ->
    StripeCheckout.open
      key:         StripeKey
      address:     true
      amount:      dollarsToCentsFilter($scope.cart.total)
      currency:    'usd'
      name:        'BodyFuel'
      description: "#{$scope.cart.num_cart_shirts} Shirts"
      panelLabel:  'Checkout'
      token:       $scope.token

  $scope.token = (response) ->
    $scope.stripe = { card: {} }
    $scope.stripe.id = response.id
    $scope.stripe.card = response.card
    $scope.$apply $scope.stripe
    Utils.adjustTileSize '.tiles-2'

  $scope.create_order = ->
    return if _.isUndefined $scope.stripe
    $scope.saving = true
    Order.save
      stripe_token: $scope.stripe.id
      authenticity_token: $scope.authenticity_token
      (data) -> window.location = data.path