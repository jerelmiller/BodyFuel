class OrdersController < ApplicationController
  layout 'cart_layout'

  def create
    @order = Order.create cart_id: current_cart.id
    render json: { errors: model_errors(@order) }, status: :unprocessable_entity and return unless @order.errors.empty?
    render json: { path: confirmation_order_path(@order) }, status: :ok

    cookies.delete :cart_id
  end

  def confirmation
    @order = Order.where(order_number: params[:id]).first
  end
end