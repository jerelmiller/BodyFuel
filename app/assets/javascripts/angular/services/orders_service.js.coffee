angular.module('orders_service', ['ngResource'])
.factory 'Order', ($resource) ->
  $resource '/orders/:id', { id: '@id' },
    save: { method: 'POST' },
    update: { method: 'PUT' }
