class Admin::MealsController < Admin::AdminController
  before_filter :get_meal, only: [:edit, :update, :destroy]

  def index
    @meals = Meal.all
  end

  def update
    @meal.update_attributes params[:meal]
    redirect_to admin_meals_path
  end

  def new
    @meal = Meal.new
  end

  def create
    @meal = Meal.create params[:meal]
    redirect_to admin_meals_path
  end

  def destroy
    @meal.destroy
    render json: { path: admin_meals_path }, status: :ok
  end

  private

  def get_meal
    @meal = Meal.find params[:id]
  end
end