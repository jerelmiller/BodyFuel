angular.module('colors_service', ['ngResource'])
.factory 'Color', ($resource) ->
  $resource '/admin/colors/:id', { id: '@id' },
    save: { method: 'POST', params: {} }