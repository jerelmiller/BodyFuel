class Meal < ActiveRecord::Base
  include Randomizer
  validates :name, :image, presence: true

  attr_accessible :image, :name

  has_attached_file :image,
    storage: :dropbox,
    styles: { normal: '240x160>', large: '500x500>' },
    default_url: nil,
    dropbox_credentials: "#{Rails.root}/config/dropbox.yml",
    dropbox_options: { path: proc { |style| "bodyfuel/#{Rails.env}/meals/#{style}/#{id}/#{image.original_filename}"} }

  validates_attachment :image, content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif'] }

  def self.get_random_meals
    ids = []
    num_meals = (count / 3.0).floor
    num_meals = 1 if num_meals < 1
    @meals_1 = Meal.random num_meals
    ids << @meals_1.try(:map, &:id)
    @meals_2 = Meal.where{ id << ids }.random num_meals
    ids << @meals_2.try(:map, &:id)
    @meals_3 = Meal.where{ id << ids }.random num_meals
    ids << @meals_3.try(:map, &:id)

    Meal.where{ id << ids }.each_with_index { |leftover, index| instance_variable_get("@meals_#{index + 1}") << leftover }

    return @meals_1, @meals_2, @meals_3
  end
end