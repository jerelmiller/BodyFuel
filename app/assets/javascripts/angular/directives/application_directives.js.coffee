application_directives = angular.module('application_directives', [])

application_directives.directive 'eatClick', ->
  restrict: 'A'
  link: (scope, element, attrs) ->
    element.bind 'click', (e) ->
      e.preventDefault()

application_directives.directive 'submitForm', ->
  restrict: 'A'
  scope:
    valid: '&'
  link: (scope, element, attrs) ->
    element.bind 'click', ->
      scope.$parent.$apply attrs.valid
      if scope.valid()
        $(attrs.submitForm).submit()