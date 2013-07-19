class CartProductsController < ApplicationController

  def create
    cart_product_params = params[:cart_product]
    @cart_product = CartProduct.where(cart_id: cart_product_params[:cart_id], product_id: cart_product_params[:product_id]).first_or_initialize

    @cart_product.update_attributes(params[:cart_product])
    return render json: { errors: model_errors(@cart_product) }, status: :unprocessable_entity unless @cart_product.errors.empty?
  end
end