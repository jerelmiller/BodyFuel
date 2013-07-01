class Admin::AdminController < ApplicationController
  before_filter :require_login
  before_filter :get_orders
  layout 'admin'

  private

  def get_orders
    @orders = Order.all
  end
end