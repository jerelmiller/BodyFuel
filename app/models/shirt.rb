class Shirt < ActiveRecord::Base
  has_one :product, as: :content
  has_many :color_shirts
  has_many :shirt_sizes
  has_many :colors, through: :color_shirts
  has_many :sizes, through: :shirt_sizes

  attr_accessible :price, :stock, :name

  after_create :create_product

  private

  def create_product
    product = Product.new
    product.content = self
    product.save
  end
end