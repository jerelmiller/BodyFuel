shirt_directives = angular.module('shirt_directives', [])

shirt_directives.directive 'fadeShirtTile', ->
  restrict: 'A'
  link: (scope, element, attrs) ->
    element.bind 'click', (e) ->
      tileItem = element.parents('.tile-item')
      tileItem.animate {opacity: 0, top: -50},
        duration: 300,
        complete: ->
          _.delay (-> scope.$apply attrs.fadeShirtTile ), 300