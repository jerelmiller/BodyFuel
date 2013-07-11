class Admin::SizesController < Admin::AdminController

  def create
    @size = Size.create params[:size]

    return render json: { error_message: @size.errors.full_messages }, status: :unprocessable_entity unless @size.errors.empty?
    render json: { size: @size }, status: :ok
  end
end