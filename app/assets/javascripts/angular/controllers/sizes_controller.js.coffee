angular.module('sizes_controller', [])
.controller 'SizesCtrl', ($scope, DataSeed, Size) ->
  DataSeed.then (data) ->
    _.extend $scope, sizes: data.sizes
    _.extend $scope, data.dependencies

    $scope.is_editing_size = false
    $scope.size_errors = {}

  $scope.save_size = ->
    size = {
      size: $scope.new_size
    }

    $scope.reset_errors()
    $scope.validate()
    if $scope.is_valid()
      Size.save(
        size: size
        authenticity_token: $scope.authenticity_token
      , $scope.success, $scope.error)

  $scope.is_valid = ->
    _.isEmpty $scope.size_errors

  $scope.reset_errors = ->
    $scope.size_errors = {}

  $scope.full_error_messages = ->
    messages = _.reduce $scope.size_errors, ((memo, error) -> memo.push(error); memo), []
    messages.join(',')

  $scope.validate = ->
    $scope.size_errors.size = "Size can't be blank" if _.isEmpty $scope.new_size

  $scope.success = (response) ->
    $scope.sizes.push response.size
    $scope.is_editing_size = false
    $scope.new_size = ''

  $scope.error = (response) ->
    return $scope.size_errors = response.data.errors if response.status == 422
    $scope.size_errors.general = 'There were errors trying to save the size. Please try again'