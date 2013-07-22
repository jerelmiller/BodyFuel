angular.module('shirts_service', ['ngResource'])
.factory 'Shirt', ($resource) ->
  $resource '/admin/shirts/:id', { id: '@id' },
    update: { method: 'PUT', params: {} },
    save: { method: 'POST', params: {} },
    delete: { method: 'DELETE', params: {} }