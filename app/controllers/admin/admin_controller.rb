class Admin::AdminController < ApplicationController
  before_filter :require_login
  before_filter :get_orders
  layout 'admin'

  def index
    @shirts = Shirt.all
  end

  private

  def get_orders
    @orders = Order.all
  end
end