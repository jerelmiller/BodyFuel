class RemoveNameFromColor < ActiveRecord::Migration
  def up
    remove_column :colors, :name
  end

  def down
    add_column :colors, :name, :string, default: nil
  end
end
