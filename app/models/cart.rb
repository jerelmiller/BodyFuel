class Cart < ActiveRecord::Base
  belongs_to :customer
  has_many :cart_shirts
  has_one :order

  def total(options={})
    total = cart_shirts.map(&:total).reduce(:+) || 0
    total = (total * 100).to_i if options[:as_cents]
    total
  end

  def associate_customer!(customer)
    self.customer = customer
    self.save
  end

end