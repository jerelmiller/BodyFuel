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
    random_meals = all.shuffle
    num_meals = (random_meals.length / 3.0).floor
    num_meals = 1 if num_meals < 1

    random_meals = random_meals.in_groups_of num_meals, false
    meals_1 = random_meals.delete_at(0) || []
    meals_2 = random_meals.delete_at(0) || []
    meals_3 = random_meals.delete_at(0) || []

    meals_1 << random_meals if random_meals.present?

    return meals_1.flatten, meals_2.flatten, meals_3.flatten
  end
end