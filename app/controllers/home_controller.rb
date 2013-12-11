class HomeController < ApplicationController

  def contact_submit
    ContactMailer.send_contact_email(params[:name], params[:email], params[:message]).deliver
    redirect_to contact_path
  end

  def order
    @shirts = Shirt.not_deleted.includes(:colors).includes(:sizes).most_recent
  end
end
