class User < ActiveRecord::Base
  authenticates_with_sorcery!
  # attr_accessible :title, :body

  def to_s
    first_name
  end
end
