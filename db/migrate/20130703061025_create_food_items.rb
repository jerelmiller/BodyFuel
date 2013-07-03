class CreateFoodItems < ActiveRecord::Migration
  def up
    create_table :food_items do |t|
      t.string :name, null: false
      t.timestamps
    end
  end

  def down
    drop_table :food_items
  end
end
