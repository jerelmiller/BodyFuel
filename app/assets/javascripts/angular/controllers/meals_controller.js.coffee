angular.module('meals_controller', [])
.controller 'MealsCtrl', ($scope, DataSeed, Meal) ->
  DataSeed.then (data) ->
    _.extend $scope, meal: data.meal
    _.extend $scope, meals: data.meals
    _.extend $scope, data.dependencies

    $scope.errors = {}

  $scope.has_errors = ->
    !_.isEmpty $scope.errors

  $scope.reset_errors = ->
    $scope.errors = {}

  $scope.is_valid = ->
    $scope.reset_errors()
    $scope.validate()
    !$scope.has_errors()

  $scope.validate = ->
    $scope.errors.name = "Name can't be blank" if _.isEmpty $scope.meal.name

  $scope.redirect_callback = (response) ->
    window.location = response.path

  $scope.delete = (meal, callback, should_confirm) ->
    confirmed = true unless should_confirm
    confirmed = confirm 'Are you sure?' if should_confirm
    if confirmed
      Meal.delete(
        id: meal.id
        authenticity_token: $scope.authenticity_token
      , callback)

  $scope.remove_meal = (meal) ->
    $scope.delete(meal)
    $scope.meals = _.filter $scope.meals, (m) ->
      m.id != meal.id