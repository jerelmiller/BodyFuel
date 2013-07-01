class CreateCustomers < ActiveRecord::Migration
  def up
    create_table :customers do |t|
      t.string :first_name,   null: false
      t.string :last_name,    null: false
    end
  end

  def down
    drop_table :customers
  end
end
