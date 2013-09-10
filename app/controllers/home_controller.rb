class HomeController < ApplicationController

  def index
    @meals_one, @meals_two, @meals_three = Meal.get_random_meals
    @tiles = [@meals_one, @meals_two, @meals_three].compact.length
  end

  def contact_submit
    ContactMailer.send_contact_email(params[:name], params[:email], params[:message]).deliver
    redirect_to contact_path
  end

  def order
    @shirts = Shirt.not_deleted.includes(:colors).includes(:sizes).most_recent
  end
end
