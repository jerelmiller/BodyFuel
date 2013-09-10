class Order < ActiveRecord::Base
  belongs_to :cart
  has_one :customer, through: :cart

  before_validation :set_defaults, on: :create
  validates :order_number, presence: true

  attr_accessible :cart_id, :fulfilled_fl, :read_fl

  delegate :email,
           :address,
           :city,
           :state,
           :zipcode,
           to: :customer

  self.per_page = 10

  def self.most_recent
    order('created_at desc')
  end

  def self.find(order_number)
    where(order_number: order_number).first || super(order_number)
  end

  def self.unread
    where(read_fl: false)
  end

  def to_param
    order_number
  end

  def fulfill!
    update_attributes fulfilled_fl: true
  end

  def read!
    update_attributes read_fl: true
  end

  def read?
    read_fl
  end

  def unfulfill!
    update_attributes fulfilled_fl: false
  end

  def fulfilled?
    fulfilled_fl
  end

  private

  def set_defaults
    self.order_number ||= Utils.generate_random_string
  end

end