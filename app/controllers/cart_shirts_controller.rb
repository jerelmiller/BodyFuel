class CartShirtsController < ApplicationController
  before_filter :get_cart_shirt, only: [:update, :destroy]

  def create
    @cart_shirt = CartShirt.where(filtered_params.except(:quantity)).first_or_initialize
    @cart_shirt.quantity += params[:cart_shirt][:quantity].to_i
    @cart_shirt.update_attributes params[:cart_shirt].except(:quantity)
    return render json: { errors: model_errors(@cart_shirt) }, status: :unprocessable_entity unless @cart_shirt.errors.empty?
  end

  def update
    @cart_shirt.update_attributes filtered_params
    return render json: { errors: model_errors(@cart_shirt) }, status: :unprocessable_entity unless @cart_shirt.errors.empty?
  end

  def destroy
    @cart_shirt.destroy
    return render json: { error: model_errors(@cart_shirt) }, status: :unprocessable_entity unless @cart_shirt.errors.empty?
  end

private

  def get_cart_shirt
    @cart_shirt = CartShirt.find params[:id]
  end

  def filtered_params
    params[:cart_shirt].slice *CartShirt.checked_attributes
  end
end