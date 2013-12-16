json.(shirt,
  :id,
  :name,
  :price,
  :stock
)

json.edit_link edit_admin_shirt_path(shirt) unless shirt.new_record?
json.design_large shirt.design.url(:large)
json.design_order shirt.design.url(:order)
json.design_admin shirt.design.url(:admin)

json.shirt_colors do
  json.partial! 'colors/colors', colors: shirt.shirt_colors
end

json.text_colors do
  json.partial! 'colors/colors', colors: shirt.text_colors
end

json.sizes do
  json.partial! 'sizes/sizes', sizes: shirt.sizes
end