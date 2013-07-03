class CreateProducts < ActiveRecord::Migration
  def up
    create_table :products do |t|
      t.integer :content_id,      null: false
      t.string  :content_type,    null: false
      t.timestamps
    end
  end

  def down
    drop_table :products
  end
end
