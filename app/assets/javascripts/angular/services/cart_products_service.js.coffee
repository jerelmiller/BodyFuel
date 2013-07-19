angular.module('cart_products_service', ['ngResource'])
.factory 'CartProduct', ($resource) ->
  $resource '/cart_products/:id', { id: '@id' },
    save: { method: 'POST', params: {} }