json.(shirt,
  :id,
  :name,
  :price,
  :stock
)

json.colors do
  json.partial! 'colors/colors', colors: shirt.colors
end

json.sizes do
  json.partial! 'sizes/sizes', sizes: shirt.sizes
end