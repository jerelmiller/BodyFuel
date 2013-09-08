class Admin::OrdersController < Admin::AdminController
  before_filter :get_order, except: :index

  def index
    @orders = Order.page(params[:page]).most_recent
  end

  def show
    session[:return_to] = request.referer
  end

  def fulfill
    @order.fulfill!
    redirect_to(session[:return_to]) and session.delete(:return_to)
  end

  def unfulfill
    @order.unfulfill!
    redirect_to request.referer
  end

  private

  def get_order
    @order = Order.where(order_number: params[:id]).first
  end
end