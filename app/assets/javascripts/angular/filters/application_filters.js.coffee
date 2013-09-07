angular.module('application_filters', [])
.filter 'zeroPad', ->
  (number, threshholdNum) ->
    return if _.isUndefined number
    return number if number.toString().length > threshholdNum
    "#{Array(threshholdNum).join('0')}#{number}".slice -threshholdNum
.filter 'dollarsToCents', ->
  (number) ->
    parseInt(number) * 100
.filter 'pluralize', ->
  (count, word) ->
    return "#{count} #{word}s" unless parseInt(count) == 1
    "#{count} #{word}"