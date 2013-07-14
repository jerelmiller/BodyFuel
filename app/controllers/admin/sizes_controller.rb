class Admin::SizesController < Admin::AdminController

  def create
    @size = Size.create params[:size]

    return render json: { errors: model_errors(@size) }, status: :unprocessable_entity unless @size.errors.empty?
  end
end