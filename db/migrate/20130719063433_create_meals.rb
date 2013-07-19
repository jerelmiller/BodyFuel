class CreateMeals < ActiveRecord::Migration
  def self.up
    create_table :meals do |t|
      t.string :name, null: false
      t.attachment :image
    end
  end

  def self.down
    drop_attached_file :meals, :image
  end
end
