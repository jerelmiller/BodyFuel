class OrdersController < ApplicationController
  layout 'cart_layout'

  def create
    @order = Order.create cart_id: current_cart.id
    Stripe::Charge.create({
      amount: current_cart.total(as_cents: true),
      currency: 'usd',
      card: params[:stripe_token],
      description: "Order for #{current_cart.customer.full_name} <#{current_cart.customer.email}>"
    })

    render json: { errors: model_errors(@order) }, status: :unprocessable_entity and return unless @order.errors.empty?
    render json: { path: confirmation_order_path(@order) }, status: :ok

    cookies.delete :cart_id
  rescue Stripe::CardError => e
    render json: { errors: [e] }, status: :unprocessable_entity and return
  end

  def confirmation
    @order = Order.where(order_number: params[:id]).first
  end
end