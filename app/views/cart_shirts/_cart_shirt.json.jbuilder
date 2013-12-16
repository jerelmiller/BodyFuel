json.(cart_shirt,
  :id,
  :price,
  :shirt_id,
  :cart_id,
  :quantity,
  :shirt_color_id,
  :text_color_id,
  :size_id
)

json.name cart_shirt.shirt.name
json.shirt_color cart_shirt.shirt_color.hex_value
json.text_color cart_shirt.text_color.try(:hex_value)
json.size cart_shirt.size.size