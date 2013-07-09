angular.module('shirts_controller', [])
.controller 'ShirtsCtrl', ($scope, DataSeed, Color) ->
  DataSeed.then (data) ->
    _.extend $scope, data

    $scope.is_editing_color = false

  $scope.add_color = ->
    color = {}
    color.hex_value = $scope.format_color $scope.new_color_value
    $scope.colors.push color

    $scope.is_editing_color = false
    $scope.new_color_value = ''

    Color.save(
      color: color
      authenticity_token: $scope.authenticity_token
    )

  $scope.format_color = (hex_value) ->
    "##{hex_value?.replace('#', '').toUpperCase()}"