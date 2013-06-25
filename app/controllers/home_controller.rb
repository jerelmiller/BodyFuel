class HomeController < ApplicationController
  layout 'home_layout'

  def contact_submit
    puts params
    redirect_to contact_path
  end
end
