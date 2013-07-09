class ShirtSize < ActiveRecord::Base
  self.table_name = 'shirts_sizes'
  belongs_to :shirt
  belongs_to :size
end