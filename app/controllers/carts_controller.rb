class CartsController < ApplicationController
  layout :choose_layout

  def checkout
    @customer = Customer.new
  end

  private

  def choose_layout
    return 'main' if params[:action].eql? 'show'
    'cart_layout'
  end
end