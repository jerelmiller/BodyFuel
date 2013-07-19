class Admin::MealsController < Admin::AdminController

  def index
    @meals = Meal.all
  end
end