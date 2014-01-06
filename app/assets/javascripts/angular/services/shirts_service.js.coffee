angular.module('shirts_service', ['ngResource'])
.factory 'Shirt', ($resource) ->
  $resource '/admin/shirts/:id', { id: '@id' },
    update: { method: 'PUT', params: {} }
    save: { method: 'POST', params: {} }
    delete: { method: 'DELETE', params: {} }

.factory 'ShirtDesign', ($resource) ->
  $resource '/shirts/:id/design/:style', { id: '@id', style: '@style' },
    design: { method: 'GET' }