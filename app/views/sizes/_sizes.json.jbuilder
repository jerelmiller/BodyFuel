json.(sizes) do |json, size|
  json.partial! 'sizes/size', size: size
end