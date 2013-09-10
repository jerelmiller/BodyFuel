class Admin::OrdersController < Admin::AdminController
  before_filter :get_order, except: [:index, :show]

  def index
    @orders = Order.page(params[:page]).most_recent
    @new_order_ids = Order.unread.pluck :id
  end

  def show
    @order = Order.where(order_number: params[:id])
                  .includes(:customer)
                  .includes{ cart.cart_shirts.shirt }
                  .includes{ cart.cart_shirts.color }
                  .includes{ cart.cart_shirts.size }
                  .first
    @order.read!
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
    @order = Order.find params[:id]
  end
end