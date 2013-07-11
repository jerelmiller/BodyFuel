angular.module('shirts_controller', [])
.controller 'ShirtsCtrl', ($scope, DataSeed, Color, Shirt, Size) ->
  DataSeed.then (data) ->
    _.extend $scope, data

    $scope.is_editing_color = false
    $scope.shirt_colors ||= []
    $scope.shirt_sizes ||= []
    $scope.shirt ||= {
      price: 0
      stock: 0
    }

  $scope.shirt_has_color = (color) ->
    _.any $scope.shirt_colors, (c) ->
      c.id == color.id

  $scope.shirt_has_size = (size) ->
    _.any $scope.shirt_sizes, (s) ->
      s.id == size.id

  $scope.toggle_color = (color) ->
    return $scope.shirt_colors = _.without($scope.shirt_colors, color) if $scope.shirt_has_color(color)
    $scope.shirt_colors.push color

  $scope.toggle_size = (size) ->
    return $scope.shirt_sizes = _.without($scope.shirt_sizes, size) if $scope.shirt_has_size(size)
    $scope.shirt_sizes.push size

  $scope.save_color = ->
    color = {}
    color.hex_value = $scope.format_color $scope.new_color_value

    $scope.is_editing_color = false
    $scope.new_color_value = ''

    Color.save(
      color: color
      authenticity_token: $scope.authenticity_token
    , $scope.success, $scope.error)

  $scope.save_size = ->
    size = {}
    size.size = $scope.new_size

    $scope.is_editing_size = false
    $scope.new_size = ''

    Size.save(
      size: size
      authenticity_token: $scope.authenticity_token
    , $scope.success, $scope.error)

  $scope.success = (response) ->
    $scope.colors.push response.color if response.color
    $scope.sizes.push response.size if response.size

  $scope.error = (response) ->
    console.log 'error'

  $scope.save = ->
    Shirt.save(
      shirt: $scope.shirt
      colors: $scope.shirt_colors
      sizes: $scope.shirt_sizes
      authenticity_token: $scope.authenticity_token
    , (response) -> window.location = response.path )


  $scope.format_color = (hex_value) ->
    "##{hex_value?.replace('#', '').toUpperCase()}"