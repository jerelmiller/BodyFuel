class CreateSizes < ActiveRecord::Migration
  def up
    create_table :sizes do |t|
      t.string :size, null: false
      t.timestamps
    end
  end

  def down
    drop_table :sizes
  end
end
