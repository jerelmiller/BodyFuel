angular.module('cart_shirts_service', ['ngResource'])
.factory 'CartShirt', ($resource) ->
  $resource '/cart_shirts/:id', { id: '@id' },
    save: { method: 'POST' }
    update: { method: 'PUT' }
    destroy: { method: 'DELETE' }