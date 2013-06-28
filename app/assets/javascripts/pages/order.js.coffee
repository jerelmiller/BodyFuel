# Pages.Order = {}

class Pages.Order
  constructor: ->
    $('.sizes span').click @onSizeClick
    $('.colors .color').click @onColorClick

  onSizeClick: ->
    $(@).parent().find('span').removeClass('selected')
    $(@).addClass('selected')

  onColorClick: ->
    $(@).parent().find('.color').removeClass('selected')
    $(@).addClass('selected')