json.(colors) do |json, color|
  json.partial! 'colors/color', color: color
end