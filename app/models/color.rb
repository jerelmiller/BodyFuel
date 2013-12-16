class Color < ActiveRecord::Base
  attr_accessible :hex_value

  validates :hex_value, presence: true
  validate :hex_value_is_valid_hex

  private

  def hex_value_is_valid_hex
    errors.add :base, 'Color is not a valid hex value' unless /^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$/.match self.hex_value
  end
end