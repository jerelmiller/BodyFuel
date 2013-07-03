class CreateShirtsSizes < ActiveRecord::Migration
  def up
    create_table :shirts_sizes, id: false do |t|
      t.integer :shirt_id, null: false
      t.integer :size_id, null: false
    end
  end

  def down
    drop_table :shirts_sizes
  end
end
