angular.module('meals_service', ['ngResource'])
.factory 'Meal', ($resource) ->
  $resource '/admin/meals/:id', { id: '@id' },
    save: { method: 'POST' }
    update: { method: 'PUT' }
    delete: { method: 'DELETE' }

.factory 'MealImage', ($resource) ->
  $resource '/meals/:id/image/:style', { id: '@id' },
    fetch: { method: 'GET' }