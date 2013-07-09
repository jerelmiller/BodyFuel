class ColorShirt < ActiveRecord::Base
  self.table_name = 'colors_shirts'
  belongs_to :color
  belongs_to :shirt
end