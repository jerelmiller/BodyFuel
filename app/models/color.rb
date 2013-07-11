class Color < ActiveRecord::Base
  attr_accessible :hex_value

  validates :hex_value, presence: true, uniqueness: true
end