class Admin::ShirtsController < Admin::AdminController
  def new
    @shirt = Shirt.new
    @colors = Color.all
    @sizes = Size.all
  end

  def create
    @shirt = Shirt.new params[:shirt]
    if @shirt.save
      flash[:success] = 'Successfully added a new shirt design'
      redirect_to admin_products_path
    else
      render :new
    end
  end
end