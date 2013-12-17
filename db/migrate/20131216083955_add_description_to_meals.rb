class AddDescriptionToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :description, :text, after: :name
  end
end
