angular.module('mealsListApp', ['application_services', 'application_filters'])
.controller 'MealsCtrl', ($scope, DataSeed) ->
  DataSeed.then (data) ->
    angular.extend $scope, data

  $scope.modalInfo = {}
  $scope.setModalInfo = (meal) -> $scope.modalInfo = meal