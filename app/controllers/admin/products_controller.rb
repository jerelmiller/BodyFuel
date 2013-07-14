class Admin::ProductsController < Admin::AdminController

  def index
    @products = Product.all
    @shirts = Shirt.all
    @food_products = FoodProduct.all
    @shirts_sold = Shirt.num_sold
  end
end