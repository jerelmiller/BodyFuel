class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'main'
  helper_method :current_cart

  protected

  def not_authenticated
    flash[:error] = 'You must first login to see that page'
    redirect_to login_path
  end

  def model_errors(model)
    model.errors.messages.reduce({}) { |hash, (attr, error)|  hash[attr] = model.errors.full_message(attr, error.join(',')); hash }
  end

  private

  def current_cart
    @_current_cart ||= if Cart.exists?(session[:cart_id])
      Cart.find session[:cart_id]
    else
      cart ||= Cart.create
      session[:cart_id] = cart.id
      cart
    end
  end


end
