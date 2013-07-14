angular.module('shirts_service', ['ngResource'])
.factory 'Shirt', ($resource) ->
  $resource '/admin/products/shirts/:id', { id: '@id' },
    update: { method: 'PUT', params: {} },
    save: { method: 'POST', params: {} }