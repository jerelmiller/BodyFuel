class Admin::ColorsController < Admin::AdminController

  def create
    @color = Color.create params[:color]

    return render json: { error_message: @color.errors.full_messages }, status: :unprocessable_entity unless @color.errors.empty?
    render json: { color: @color }, status: :ok
  end
end