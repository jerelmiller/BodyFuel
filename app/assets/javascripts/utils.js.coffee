window.Utils ||= {}

Utils.adjustTileSize = (namespace) ->
  _.delay ->
    $item = $("#{namespace} .tile-item")
    heights = $item.map (index, element) -> $(element).height()
    maxHeight = _.max heights, (height) -> height
    $item.height maxHeight
  , 150

Utils.randomNumber = (min, max) ->
  Math.floor(min + (Math.random() * (max - min)))