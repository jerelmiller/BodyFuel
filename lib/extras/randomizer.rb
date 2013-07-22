module Randomizer
  extend ActiveSupport::Concern

  module ClassMethods
    def random(records = 1)
      if (c = count) != 0
        find :all, offset: rand(c), limit: records
      end
    end
  end
end