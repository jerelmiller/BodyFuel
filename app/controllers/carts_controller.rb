class CartsController < ApplicationController
  layout :choose_layout
  before_filter :check_customer, only: :payment

  def checkout
    @customer = current_cart.customer || Customer.new
  end

  def payment
    @customer = current_cart.customer
  end

  private

  def check_customer
    redirect_to checkout_path if current_cart.customer.nil?
  end

  def choose_layout
    return 'main' if params[:action].eql? 'show'
    'cart_layout'
  end
end