class Admin::ProductsController < Admin::AdminController

  def index
    @products = Product.all
    @shirts = Shirt.all
    @food_products = FoodProduct.all
  end
end