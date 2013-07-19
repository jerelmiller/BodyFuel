json.(meals) do |json, meal|
  json.partial! 'meals/meal', meal: meal
end