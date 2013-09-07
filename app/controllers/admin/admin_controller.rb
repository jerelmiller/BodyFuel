class Admin::AdminController < ApplicationController
  before_filter :require_login
  before_filter :get_orders
  layout 'admin'

  private

  def get_orders
    @order_count = Order.count
  end
end