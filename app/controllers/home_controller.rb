class HomeController < ApplicationController

  def contact_submit
    puts params
    redirect_to contact_path
  end
end
