class Shirt < ActiveRecord::Base
  has_one :product, as: :content
  has_and_belongs_to_many :colors # create join model
  has_and_belongs_to_many :sizes # create join model

  attr_accessible :price

  accepts_nested_attributes_for :colors, allow_destroy: false
  accepts_nested_attributes_for :sizes, allow_destroy: false

  after_create :create_product

  private

  def create_product
    product = Product.new
    product.content = self
    product.save
  end
end