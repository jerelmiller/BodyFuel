class ShirtColor < Color
  validates :hex_value, uniqueness: true
end