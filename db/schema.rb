# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131216083955) do

  create_table "cart_shirts", :force => true do |t|
    t.integer  "cart_id",                                                       :null => false
    t.integer  "shirt_id",                                                      :null => false
    t.integer  "quantity",                                     :default => 0,   :null => false
    t.integer  "shirt_color_id",                                                :null => false
    t.integer  "size_id",                                                       :null => false
    t.datetime "created_at",                                                    :null => false
    t.datetime "updated_at",                                                    :null => false
    t.decimal  "price",          :precision => 6, :scale => 2, :default => 0.0, :null => false
    t.integer  "text_color_id"
  end

  create_table "carts", :force => true do |t|
    t.decimal  "total_price", :default => 0.0, :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.integer  "customer_id"
  end

  create_table "colors", :force => true do |t|
    t.string   "hex_value",                            :null => false
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
    t.string   "type",       :default => "ShirtColor", :null => false
  end

  create_table "colors_shirts", :id => false, :force => true do |t|
    t.integer "color_id", :null => false
    t.integer "shirt_id", :null => false
  end

  create_table "customers", :force => true do |t|
    t.string   "first_name", :null => false
    t.string   "last_name",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "email"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
  end

  create_table "meals", :force => true do |t|
    t.string   "name",               :null => false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "description"
  end

  create_table "orders", :force => true do |t|
    t.string   "order_number",                    :null => false
    t.integer  "cart_id",                         :null => false
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.boolean  "fulfilled_fl", :default => false, :null => false
    t.boolean  "read_fl",      :default => false, :null => false
  end

  create_table "shirts", :force => true do |t|
    t.string   "name"
    t.decimal  "price",               :default => 0.0,   :null => false
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "design_file_name"
    t.string   "design_content_type"
    t.integer  "design_file_size"
    t.datetime "design_updated_at"
    t.boolean  "stock",               :default => false, :null => false
    t.boolean  "delete_fl",           :default => false, :null => false
  end

  create_table "shirts_sizes", :id => false, :force => true do |t|
    t.integer "shirt_id", :null => false
    t.integer "size_id",  :null => false
  end

  create_table "sizes", :force => true do |t|
    t.string   "size",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",            :null => false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
  end

  add_index "users", ["last_logout_at", "last_activity_at"], :name => "index_users_on_last_logout_at_and_last_activity_at"

end
