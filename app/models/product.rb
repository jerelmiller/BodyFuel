class Product < ActiveRecord::Base
  belongs_to :content, polymorphic: true

end