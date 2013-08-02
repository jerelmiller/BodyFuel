json.(cart_shirt,
  :id,
  :price,
  :shirt_id,
  :cart_id,
  :quantity,
  :color_id,
  :size_id
)

json.name cart_shirt.shirt.name
json.hex_value cart_shirt.color.hex_value
json.size cart_shirt.size.size