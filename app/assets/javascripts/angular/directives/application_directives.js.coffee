application_directives = angular.module('application_directives', [])

application_directives.directive 'eatClick', ($parse) ->
  restrict: 'A'
  link: (scope, element, attrs) ->
    eatClickAttr = $parse attrs.eatClick
    element.bind 'click', (e) ->
      e.preventDefault() if _.isEmpty(attrs.eatClick) || eatClickAttr(scope)

application_directives.directive 'submitForm', ->
  restrict: 'A'
  scope:
    valid: '&'
    saving: '='
  link: (scope, element, attrs) ->
    element.bind 'click', ->
      if scope.valid()
        scope.$apply -> scope.saving = true if attrs.saving
        angular.element(attrs.submitForm).submit()


application_directives.directive 'imagePreview', ->
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


application_directives.directive 'hiddenValue', ->
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

application_directives.directive 'fadeTile', ->
  restrict: 'A'
  link: (scope, element, attrs) ->
    element.bind 'click', (e) ->
      if confirm('Are you sure?')
        tileItem = element.parents('.tile-item')
        tileItem.animate { opacity: 0, top: -50 },
          duration: 300,
          complete: ->
            _.delay (-> scope.$apply attrs.fadeTile ), 300

application_directives.directive 'fadeOut', ($parse) ->
  (scope, element, attrs) ->
    tr = element.parents('tr')
    element.bind 'click', (e) ->
      if confirm('Are you sure?')
        tr.animate { opacity: 0 },
          duration: 300,
          complete: ->
            tr.hide()
            _.delay (-> scope.$apply attrs.fadeOut)

application_directives.directive 'enterPressed', ->
  (scope, element, attrs) ->
    element.bind 'keyup', (e) ->
      element[attrs.enterPressed]() if e.keyCode == 13

application_directives.directive 'textBlur', ($parse) ->
  (scope, element, attrs) ->
    fn = $parse attrs.textBlur
    element.bind 'blur', (event) ->
      scope.$apply -> fn scope, $event: event

application_directives.directive 'fadeInOut', =>
  restrict: 'A'
  scope:
    fadeInOut: '='
  link: (scope, element, attrs) ->
    attrs.fadeInDuration ||= 200
    attrs.fadeOutDuration ||= 500

    element.css 'opacity', 0
    scope.$watch 'fadeInOut', (shouldFade) =>
      if shouldFade
        element.show()
        fade 1, attrs.fadeInDuration, ->
          _.delay ->
            fade 0, attrs.fadeOutDuration, -> element.hide()
          , attrs.animationDuration

    fade = (opacity, duration, callback) ->
      element.animate { opacity: opacity },
        duration: duration,
        complete: callback

application_directives.directive 'spin', =>
  restrict: 'E'
  template: '<div class="spinner"></div>'
  replace: true
  link: (scope, element, attrs) ->
    unless  _.isUndefined attrs.center
      element.css 'top', '50%'
      element.css 'position', 'absolute'

    scope.$watch attrs.spinOn, (spin) ->
      spin = spin || false
      opts =
        radius: 14,
        length: 12,
        width: 6

      element.spin opts if spin
      element.spin spin unless spin
      angular.element(attrs.dim).css 'opacity', ''
      angular.element(attrs.dim).css 'opacity', '0.3' if spin