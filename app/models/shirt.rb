class Shirt < ActiveRecord::Base
  has_one :product, as: :content
  has_many :color_shirts
  has_many :shirt_sizes
  has_many :colors, through: :color_shirts
  has_many :sizes, through: :shirt_sizes

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0, only_interger: true }

  attr_accessible :price, :stock, :name

  after_create :create_product

  def self.num_sold
    1
  end

  private

  def create_product
    product = Product.new
    product.content = self
    product.save
  end
end