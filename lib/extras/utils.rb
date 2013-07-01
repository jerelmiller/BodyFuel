class Utils
  def self.generate_random_string(length = 12)
    o =  [('A'..'Z'),(0..9)].map{|i| i.to_a}.flatten
    (0...length).map{ o[rand(o.length)] }.join
  end
end