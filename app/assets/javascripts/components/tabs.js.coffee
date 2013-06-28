window.Components ||= {}

class Components.Tabs
  constructor: ->
    @navigate()
    $('.tabs .tab').click @navigate

  navigate: =>
    _.defer =>
      @changeTab @_section()

  changeTab: (section) =>
    @_removeSelected()
    $selectedTab = $(".tab[data-show=#{section}]")
    $selectedTab.addClass('selected')
    @_hideAllSections()

    showClass = $selectedTab.data('show')
    $(".#{showClass}").show()


  _hideAllSections: ->
    $('.tabs .tab').map (index, el) ->
      className = $(el).data('show')
      $(".tab-section.#{className}").hide()

  _removeSelected: ->
    $('.tabs .tab').removeClass('selected')

  _section: ->
    window.location.hash.replace('#', '') || 'food'
