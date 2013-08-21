angular.module('customers_service', ['ngResource'])
.factory 'Customer', ($resource) ->
  $resource '/customers/:id', { id: '@id' },
    save: { method: 'POST' }
    update: { method: 'PUT' }