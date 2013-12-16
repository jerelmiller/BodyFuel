class AddDescriptionToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :description, :text, default: nil, after: :name
  end
end
