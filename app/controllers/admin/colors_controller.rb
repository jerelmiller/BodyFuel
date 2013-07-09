class Admin::ColorsController < Admin::AdminController

  def create
    @color = Color.create params[:color]

    render json: @color, status: :ok
  end
end