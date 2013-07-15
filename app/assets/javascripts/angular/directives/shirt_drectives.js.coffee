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

shirt_directives.directive 'imagePreview', ->
  restrict: 'A'
  scope:
    target: '@'
    hide: '@'
  link: (scope, element, attrs, ctrl) ->
    element.bind 'change', ->

      if this.files && this.files[0]
        reader = new FileReader()
        reader.readAsDataURL(this.files[0])

        reader.onloadstart = ->
          console.log 'loading'

        reader.onload = (e) ->
          $(scope.target).attr('src', e.target.result).show()
          $(scope.hide).hide()

shirt_directives.directive 'hiddenValue', ->
  restrict: 'A'
  link: (scope, element, attrs) ->
    _.defer =>
      applyValue scope.$apply(attrs.hiddenValue)

      scope.$watch attrs.hiddenValue, (value) ->
        applyValue value
      , true

    applyValue = (value) ->
      value = JSON.stringify(value) if typeof value == 'object'
      element.val value
