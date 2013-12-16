class Admin::TextColorsController < Admin::AdminController

  def create
    @text_color = TextColor.create params[:color]
    return render json: { errors: model_errors(@text_color) }, status: :unprocessable_entity unless @text_color.errors.empty?
  end
end