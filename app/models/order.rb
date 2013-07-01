class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :cart

  validates :order_number, presence: true

  before_validation :set_defaults, on: :create

  private

  def set_defaults
    self.order_number ||= Utils.generate_random_string
  end

end