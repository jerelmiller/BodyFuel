angular.module('colors_service', ['ngResource'])
.factory 'ShirtColor', ($resource) ->
  $resource '/admin/shirt_colors/:id', { id: '@id' },
    save: { method: 'POST' }

.factory 'TextColor', ($resource) ->
  $resource '/admin/text_colors/:id', { id: '@id' },
    save: { method: 'POST' }