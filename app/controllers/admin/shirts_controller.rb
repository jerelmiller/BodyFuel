class Admin::ShirtsController < Admin::AdminController
  before_filter :get_colors, :get_sizes, only: [:edit, :new]
  before_filter :get_shirt, only: [:edit, :update, :destroy]

  def index
    @shirts = Shirt.all
  end

  def update
    Shirt.transaction do
      if @shirt.update_attributes params[:shirt]
        @shirt.colors = filtered_colors
        @shirt.sizes = filtered_sizes
      else
        return render json: { errors: shirt_errors(@shirt) }, status: :unprocessable_entity
      end
    end
    respond_to do |format|
      format.json { render json: { path: admin_shirts_path }, status: :ok }
      format.html { redirect_to admin_shirts_path }
    end
  end

  def new
    @shirt = Shirt.new
  end

  def create
    @shirt = Shirt.new params[:shirt]
    Shirt.transaction do
      if @shirt.save
        @shirt.colors = Color.where(id: Array(params[:colors]).map{ |color| color[:id] }).all
        @shirt.sizes = filtered_sizes
      else
        return render json: { errors: model_errors(@shirt) }, status: :unprocessable_entity
      end
    end
    render json: { path: admin_shirts_path }, status: :ok
  end

  def destroy
    @shirt.destroy
    render json: { path: admin_shirts_path }, status: :ok
  end

  private

  def filtered_colors
    Color.where(id: Array(JSON.parse(params[:colors])).map(&:with_indifferent_access).map{ |color| color[:id] }).all
  end

  def filtered_sizes
    Size.where(id: Array(JSON.parse(params[:sizes])).map(&:with_indifferent_access).map{ |size| size[:id] }).all
  end

  def get_shirt
    @shirt = Shirt.find params[:id]
  end

  def get_colors
    @colors = Color.all
  end

  def get_sizes
    @sizes = Size.all
  end
end