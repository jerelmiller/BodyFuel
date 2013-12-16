json.(meal,
  :id,
  :name,
  :description
)

json.meal_normal meal.image.url(:normal)
json.meal_large meal.image.url(:large)
json.meal_tile meal.image.url(:tile)
json.edit_link edit_admin_meal_path(meal) unless meal.new_record?