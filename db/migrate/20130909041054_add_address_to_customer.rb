class AddAddressToCustomer < ActiveRecord::Migration
  def change
    add_column :customers, :address, :string, null: :false
    add_column :customers, :city, :string, null: :false
    add_column :customers, :state, :string, null: :false
    add_column :customers, :zipcode, :string, null: :false
  end
end
