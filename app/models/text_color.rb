class TextColor < Color
  validates :hex_value, uniqueness: true
end