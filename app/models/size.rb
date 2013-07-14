class Size < ActiveRecord::Base
  attr_accessible :size

  validates :size, presence: true, uniqueness: { case_sensitive: false }

  before_save :upcase_size

  private

  def upcase_size
    self.size = self.size.upcase
  end
end