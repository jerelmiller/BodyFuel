(($) ->
  prefix = (el) ->
      prefixes = ["Webkit", "Moz", "O", "ms"]
      i = 0
      while i < prefixes.length
        return "-#{prefixes[i].toLowerCase()}-" if prefixes[i] + "Transition" of el.style
        i++
      (if "transition" of el.style then "" else false)

  methods =
    init: (settings) ->
      @each ->
        config =
          slideDuration: 7000
          fadeDuration: 800
          slideSelector: '.slide'

        $.extend config, settings if settings
        $container = $(@)
        activeSlide = 0
        newSlide = 0
        $slides = $container.find(config.slideSelector)
        totalSlides = $slides.length
        browserPrefix = prefix $container[0]

        waitForNext = ->
          slideTimer = setTimeout ->
            changeSlides 'next'
          , config.slideDuration

        animateSlides = (activeIdx, newIdx) ->
          cleanup = ->
            $slides.eq(activeIdx).removeAttr 'style'
            activeSlide = newIdx
            waitForNext()

          $slides.eq(activeIdx).css 'z-index', 3
          $slides.eq(newIdx).css 'z-index', 2

          unless activeIdx == newIdx
            if prefix
              styles = {}
              styles["#{browserPrefix}transition"] = "opacity #{config.fadeDuration}ms"
              styles.opacity = 0
              $slides.eq(activeIdx).css styles
              styles.opacity = 1
              $slides.eq(newIdx).css styles
              fadeTimer = setTimeout (-> cleanup()), config.fadeDuration
            else
              $slides.eq(activeIdx).animate { opacity: 0 }, config.fadeDuration, -> cleanup()
              $slides.eq(newIdx).animate { opacity: 1 }, config.fadeDuration, -> cleanup()

        changeSlides = (target) ->
          if target == 'next'
            newSlide = activeSlide + 1
            newSlide = 0 if newSlide > totalSlides - 1
          else if target == 'prev'
            newSlide = activeSlide - 1
            newSlide = totalSlides - 1 if newSlide < 0

          animateSlides activeSlide, newSlide


        $slides.eq(0).css 'opacity', 1
        waitForNext()

  $.fn.fader = (settings) ->
    methods.init.apply this, arguments
) jQuery