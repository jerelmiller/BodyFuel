class CreateColorsShirts < ActiveRecord::Migration
  def up
    create_table :colors_shirts, id: false do |t|
      t.integer :color_id, null: false
      t.integer :shirt_id, null: false
    end
  end

  def down
    drop_table :colors_shirts
  end
end
