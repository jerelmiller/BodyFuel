class AddDeleteFlToShirt < ActiveRecord::Migration
  def change
    add_column :shirts, :delete_fl, :boolean, null: false, default: false
  end
end
