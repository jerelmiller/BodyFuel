alert_directives = angular.module('alert_directives', [])

alert_directives.directive 'hideAlert', ->
  restrict: 'A'
  link: (scope, element, attrs) ->
    element.bind 'click' , (e) ->
      element.parents('.alert').animate { opacity: '0' },
        duration: 300,
        complete: ->
          $(this).hide()
          $(this).css('opacity', '1')
          scope.$apply attrs.hideAlert