class Admin::ShirtsController < Admin::AdminController
  def new
    @shirt = Shirt.new
    @colors = Color.all
    @sizes = Size.all
  end

  def create
    @shirt = Shirt.new params[:shirt]
    Shirt.transaction do
      if @shirt.save
        @shirt.colors = Color.where(id: Array(params[:colors]).map{ |color| color[:id] }).all
        @shirt.sizes = Size.where(id: Array(params[:sizes]).map{ |size| size[:id] }).all
      else
        return render json: { error: @shirt.errors.full_messages }, status: :unprocessable_entity
      end
    end
    render json: { path: admin_products_path }, status: :ok
  end
end