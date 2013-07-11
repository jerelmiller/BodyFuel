class HomeController < ApplicationController

  def contact_submit
    puts params
    redirect_to contact_path
  end

  def order
    @colors = Color.all
    @shirts = Shirt.includes(:colors).all
  end
end
