angular.module('meals_controller', [])
.controller 'MealsCtrl', ($scope, DataSeed, Meal) ->
  DataSeed.then (data) ->
    _.extend $scope, meals: data.meals
    _.extend $scope, data.dependencies