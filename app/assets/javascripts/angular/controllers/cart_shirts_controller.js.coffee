angular.module('cart_shirts_controller', [])
.controller 'CartShirtsCtrl', ($scope, DataSeed, CartShirt) ->
  DataSeed.then (data) ->
    _.extend $scope, data

    $scope.errors = {}

  $scope.total = (shirt) ->
    if _isValidNumber(shirt.quantity) && _isValidNumber(shirt.price) then parseInt(shirt.quantity) * parseFloat(shirt.price) else 0

  $scope.hide_shirt_alert = (shirt, alert) ->
    delete $scope.errors[shirt.id][alert]

  $scope.reset_errors = (shirt) ->
    $scope.errors[shirt.id] = {}

  $scope.validate_shirt = (shirt) ->
    $scope.reset_errors(shirt)
    $scope.errors[shirt.id].quantity = 'Quantity must be a number' unless _isValidNumber(shirt.quantity)

  $scope.update_total = (cart_shirts) ->
    $scope.cart?.total = _.reduce cart_shirts, ((memo, shirt) -> memo + $scope.total(shirt)), 0

  $scope.delete = (shirt) ->
    console.log 'deleting shirt'

  $scope.$watch 'cart.cart_shirts', $scope.update_total, true

  _isValidNumber = (num) ->
    _.isNumber(parseFloat(num)) && !isNaN(parseFloat(num))