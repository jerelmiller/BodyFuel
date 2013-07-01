angular.module('carts_controller', [])
.controller 'CartsCtrl', ($scope, DataSeed) ->
  DataSeed.then (data) ->
    _.extend $scope, data

  $scope.add_product = ->
    console.log 'product added'
    # console.log product