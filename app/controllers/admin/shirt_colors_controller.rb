class Admin::ShirtColorsController < Admin::AdminController

  def create
    @shirt_color = ShirtColor.create params[:color]
    return render json: { errors: model_errors(@shirt_color) }, status: :unprocessable_entity unless @shirt_color.errors.empty?
  end
end