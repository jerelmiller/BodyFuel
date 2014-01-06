json.(meal,
  :id,
  :name,
  :description
)

json.image meal.image.url(image_size) if defined?(image_size)
json.edit_link edit_admin_meal_path(meal) unless meal.new_record?