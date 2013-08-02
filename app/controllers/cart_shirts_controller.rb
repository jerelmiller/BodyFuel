class CartShirtsController < ApplicationController

  def create
    @cart_shirt = CartShirt.where(filtered_params).first_or_initialize
    @cart_shirt.quantity += params[:cart_shirt][:quantity].to_i
    @cart_shirt.update_attributes params[:cart_shirt].except(:quantity)
    return render json: { errors: model_errors(@cart_shirt) }, status: :unprocessable_entity unless @cart_shirt.errors.empty?
  end

  def update
    @cart_shirt = CartShirt.find params[:id]
    @cart_shirt.update_attributes params[:cart_shirt]
    return render json: { errors: model_errors(@cart_shirt) }, status: :unprocessable_entity unless @cart_shirt.errors.empty?
  end

private

  def filtered_params
    params[:cart_shirt].slice *CartShirt.checked_attributes
  end
end