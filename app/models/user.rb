class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # attr_accessible :title, :body

  validates :first_name, :last_name, :email, presence: true
  validates :password, confirmation: true

  def to_s
    first_name
  end
end
