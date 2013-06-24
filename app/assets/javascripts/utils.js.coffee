window.Utils ||= {}

Utils.adjustTileSize = (namespace) ->
  $item = $("#{namespace} .tile-item")
  heights = $item.map (index, element) -> $(element).height()
  maxHeight = _.max heights, (height) -> height
  $item.height maxHeight

Utils.randomNumber = (min, max) ->
  Math.floor(min + (Math.random() * (max - min)))