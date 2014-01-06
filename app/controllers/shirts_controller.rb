class ShirtsController < ApplicationController

  def design
    @shirt = Shirt.find params[:id]
    render json: { design: @shirt.design.url(params[:style]) }, status: :ok
  end
end