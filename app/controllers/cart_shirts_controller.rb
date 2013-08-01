class CartShirtsController < ApplicationController

  def create
    cart_shirt_params = params[:cart_shirt]
    @cart_shirt = CartShirt.where(cart_id: cart_shirt_params[:cart_id], shirt_id: cart_shirt_params[:shirt_id]).first_or_initialize

    @cart_shirt.update_attributes(params[:cart_shirt])
    return render json: { errors: model_errors(@cart_shirt) }, status: :unprocessable_entity unless @cart_shirt.errors.empty?
  end
end