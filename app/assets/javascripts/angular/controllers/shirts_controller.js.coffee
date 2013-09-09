angular.module('shirts_controller', [])
.controller 'ShirtsCtrl', ($scope, DataSeed, Shirt) ->
  DataSeed.then (data) ->
    _.extend $scope, shirt: data.shirt
    _.extend $scope, shirts: data.shirts
    _.extend $scope, data.dependencies

    $scope.errors = {}

  $scope.has_errors = ->
    !_.isEmpty $scope.errors

  $scope.shirt_has_color = (color) ->
    _.any $scope.shirt.colors, (c) ->
      c.id == color.id

  $scope.shirt_has_size = (size) ->
    _.any $scope.shirt.sizes, (s) ->
      s.id == size.id

  $scope.toggle_color = (color) ->
    if $scope.shirt_has_color(color)
      return $scope.shirt.colors = _.filter $scope.shirt.colors, (c) ->
        c.id != color.id

    $scope.shirt.colors.push color

  $scope.toggle_size = (size) ->
    if $scope.shirt_has_size(size)
      return $scope.shirt.sizes = _.filter $scope.shirt.sizes, (s) ->
        s.id != size.id

    $scope.shirt.sizes.push size

  $scope.error = (response) ->
    return $scope.errors = response.data.errors if response.status == 422
    $scope.errors.general = 'There were errors trying to save the shirt. Please try again'

  $scope.validate = ->
    $scope.errors.name = "Name can't be blank" if _.isEmpty $scope.shirt.name
    $scope.errors.price = 'Price must be greater than or equal to 0' if parseInt($scope.shirt.price) < 0
    $scope.errors.price = 'Price is not a number' if !/^-?(\d|\.)+$/.test $scope.shirt.price.toString()

    $scope.errors.colors = 'You must select at least one color' if _.isEmpty $scope.shirt.colors
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