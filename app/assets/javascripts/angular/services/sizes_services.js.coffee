angular.module('sizes_service', ['ngResource'])
.factory 'Size', ($resource) ->
  $resource '/admin/sizes/:id', { id: '@id' },
    save: { method: 'POST', params: {} }