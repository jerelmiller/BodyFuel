class MealsController < ApplicationController

  def image
    @meal = Meal.find params[:id]
    render json: { image: @meal.image.url(params[:style]) }, status: :ok
  end
end