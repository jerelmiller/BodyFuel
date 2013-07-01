angular.module('carts_service', ['ngResource'])
.factory 'Cart', ($resource) ->
  $resource '/carts/:id', { id: '@id' },
    update: { method: 'PUT', params: {} }