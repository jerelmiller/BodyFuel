json.(meal,
  :id,
  :name
)

json.meal_normal meal.image.url(:normal)
json.meal_large meal.image.url(:large)
json.edit_link edit_admin_meal_path(meal) unless meal.new_record?