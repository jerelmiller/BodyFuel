angular.module('mealsListApp', ['application_services', 'application_filters', 'application_directives', 'meals_service'])
.controller 'MealsCtrl', ($scope, $timeout, DataSeed, MealImage) ->
  DataSeed.then (data) ->
    angular.extend $scope, data
    angular.forEach $scope.meals, (meal) -> meal.loading = true
    $timeout ->
      angular.forEach $scope.meals, (meal) ->
        MealImage.fetch id: meal.id, style: 'tile'
        , (response) ->
          meal.image = response.image
          meal.loading = false
        , (response) -> meal.loading = false
    , 200

  $scope.modalInfo = {}
  $scope.setModalInfo = (meal) ->
    $scope.modalInfo = angular.copy meal
    $scope.modalInfo.loading = true
    MealImage.fetch id: meal.id, style: 'large'
    , (response) ->
      $scope.modalInfo.image = response.image
      $scope.modalInfo.loading = false
    , (response) -> $scope.modalInfo.loading = false