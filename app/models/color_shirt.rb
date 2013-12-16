class ColorShirt < ActiveRecord::Base
  self.table_name = 'colors_shirts'
  belongs_to :shirt_color, foreign_key: :color_id
  belongs_to :text_color, foreign_key: :color_id
  belongs_to :shirt
end