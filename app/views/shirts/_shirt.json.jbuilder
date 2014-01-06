json.(shirt,
  :id,
  :name,
  :price,
  :stock
)

json.edit_link edit_admin_shirt_path(shirt) unless shirt.new_record?
json.design shirt.design.url(shirt_design) if defined?(shirt_design)

json.shirt_colors do
  json.partial! 'colors/colors', colors: shirt.shirt_colors
end

json.text_colors do
  json.partial! 'colors/colors', colors: shirt.text_colors
end

json.sizes do
  json.partial! 'sizes/sizes', sizes: shirt.sizes
end