angular.module('shirts_controller', [])
.controller 'ShirtsCtrl', ($scope, DataSeed, Shirt) ->
  DataSeed.then (data) ->
    angular.extend $scope, shirt: data.shirt
    angular.extend $scope, shirts: data.shirts
    angular.extend $scope, data.dependencies

    $scope.errors = {}

  hasAttr = (obj, attr) -> _.any $scope.shirt[attr], (c) -> c.id == obj.id
  filterAttr = (obj, attr) -> $scope.shirt[attr] = _.filter $scope.shirt[attr], (c) -> c.id != obj.id

  $scope.has_errors = -> !_.isEmpty $scope.errors
  $scope.shirt_has_color = (color) -> hasAttr color, 'shirt_colors'
  $scope.shirt_has_text_color = (color) -> hasAttr color, 'text_colors'
  $scope.shirt_has_size = (size) -> hasAttr size, 'sizes'

  $scope.toggle_shirt_color = (color) ->
    return filterAttr color, 'shirt_colors' if $scope.shirt_has_color(color)
    $scope.shirt.shirt_colors.push color

  $scope.toggle_text_color = (color) ->
    return filterAttr color, 'text_colors' if $scope.shirt_has_text_color(color)
    $scope.shirt.text_colors.push color

  $scope.toggle_size = (size) ->
    return filterAttr size, 'sizes' if $scope.shirt_has_size(size)
    $scope.shirt.sizes.push size

  $scope.error = (response) ->
    return $scope.errors = response.data.errors if response.status == 422
    $scope.errors.general = 'There were errors trying to save the shirt. Please try again'

  $scope.validate = ->
    $scope.errors.name = "Name can't be blank" if _.isEmpty $scope.shirt.name
    $scope.errors.price = 'Price must be greater than or equal to 0' if parseInt($scope.shirt.price) < 0
    $scope.errors.price = 'Price is not a number' if !/^-?(\d|\.)+$/.test $scope.shirt.price.toString()

    $scope.errors.shirt_colors = 'You must select at least one color' if _.isEmpty $scope.shirt.shirt_colors
    $scope.errors.text_colors = 'You must select at least one color' if _.isEmpty $scope.shirt.text_colors
    $scope.errors.sizes = 'You must select at least one size' if _.isEmpty $scope.shirt.sizes

  $scope.is_valid = ->
    $scope.reset_errors()
    $scope.validate()
    $scope.$apply() unless $scope.$$phase
    !$scope.has_errors()

  $scope.reset_errors = ->
    $scope.errors = {}

  $scope.save = ->
    $scope.reset_errors()
    if $scope.is_valid()
      Shirt.save(
        shirt: _format_shirt_params()
        colors: $scope.shirt.colors
        sizes: $scope.shirt.sizes
        authenticity_token: $scope.authenticity_token
      , ((response) -> window.location = response.path)
      , $scope.error)

  $scope.redirect_callback = (response) ->
    window.location = response.path

  $scope.delete = (shirt, callback) ->
    Shirt.delete(
      id: shirt.id
      authenticity_token: $scope.authenticity_token
    , callback)

  $scope.remove_shirt = (shirt) ->
    $scope.delete(shirt)
    $scope.shirts = _.filter $scope.shirts, (s) ->
      s.id != shirt.id

  $scope.update = ->
    $scope.reset_errors()
    if $scope.is_valid()
      Shirt.update(
        id: $scope.shirt.id
        shirt: _format_shirt_params()
        colors: $scope.shirt.colors
        sizes: $scope.shirt.sizes
        authenticity_token: $scope.authenticity_token
      , ((response) -> window.location = response.path)
      , $scope.error)

  _format_shirt_params = ->
    attrs = _.clone $scope.shirt
    delete attrs.id
    delete attrs.colors
    delete attrs.sizes
    delete attrs.edit_link
    attrs