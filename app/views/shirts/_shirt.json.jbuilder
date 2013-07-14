json.(shirt,
  :id,
  :name,
  :price,
  :stock
)

json.edit_link edit_admin_shirt_path(shirt) unless shirt.new_record?

json.colors do
  json.partial! 'colors/colors', colors: shirt.colors
end

json.sizes do
  json.partial! 'sizes/sizes', sizes: shirt.sizes
end