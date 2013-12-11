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
end