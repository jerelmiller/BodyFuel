class AddTypeToColor < ActiveRecord::Migration
  def change
    add_column :colors, :type, :string, null: false, after: :id, default: 'ShirtColor'
  end
end
