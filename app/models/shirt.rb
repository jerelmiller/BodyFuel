class Shirt < ActiveRecord::Base
  has_one :product, as: :content
  has_many :color_shirts
  has_many :shirt_sizes
  has_many :colors, through: :color_shirts
  has_many :sizes, through: :shirt_sizes

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0, only_interger: true }

  attr_accessible :price, :stock, :name, :design

  after_create :create_product

  has_attached_file :design,
    storage: :dropbox,
    styles: { thumb: '300x300>', medium: '270x270>', large: '500x500>' },
    default_url: nil,
    dropbox_credentials: "#{Rails.root}/config/dropbox.yml",
    dropbox_options: { path: proc { |style| "bodyfuel/#{Rails.env}/designs/#{style}/#{id}/#{design.original_filename}"} }

  validates_attachment :design, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] }

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