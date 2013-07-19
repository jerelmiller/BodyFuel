angular.module('meals_service', ['ngResource'])
.factory 'Meal', ($resource) ->
  $resource '/admin/meals/:id', { id: '@id' },
    save: { method: 'POST' }
    update: { method: 'PUT'}