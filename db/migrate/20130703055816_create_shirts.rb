class CreateShirts < ActiveRecord::Migration
  def up
    create_table :shirts do |t|
      t.string  :name, default: nil
      t.decimal :price, scale: 2, null: false, default: 0
      t.integer :stock, null: false, default: 0
      t.timestamps
    end
  end

  def down
    drop_table :shirts
  end
end
