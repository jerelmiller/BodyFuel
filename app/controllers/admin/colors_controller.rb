class Admin::ColorsController < Admin::AdminController

  def create
    @color = Color.create params[:color]
    return render json: { errors: model_errors(@color) }, status: :unprocessable_entity unless @color.errors.empty?
  end
end