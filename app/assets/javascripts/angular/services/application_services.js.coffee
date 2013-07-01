application_services = angular.module('application_services', ['ngResource'])

application_services.factory 'DataSeed', ($window, $q, $rootScope) ->
  deferred = $q.defer()
  $window.AngularDataSeed = (obj) ->
      deferred.resolve(obj)
      $rootScope.$apply()
  deferred.promise