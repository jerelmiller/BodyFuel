class Order < ActiveRecord::Base
  belongs_to :cart
  has_one :customer, through: :cart

  before_validation :set_defaults, on: :create
  validates :order_number, presence: true

  attr_accessible :cart_id

  def to_param
    order_number
  end

  private

  def set_defaults
    self.order_number ||= Utils.generate_random_string
  end

end