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

ActiveRecord::Schema.define(:version => 20130709070852) do

  create_table "cart_products", :force => true do |t|
    t.integer  "cart_id",                     :null => false
    t.integer  "product_id",                  :null => false
    t.decimal  "price",      :default => 0.0, :null => false
    t.integer  "quantity",   :default => 0,   :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
  end

  create_table "carts", :force => true do |t|
    t.decimal  "total_price", :default => 0.0, :null => false
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "colors", :force => true do |t|
    t.string   "hex_value",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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
  end

  create_table "food_items", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "food_products", :force => true do |t|
    t.string   "name",                         :null => false
    t.decimal  "price",       :default => 0.0, :null => false
    t.text     "description"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  create_table "orders", :force => true do |t|
    t.string   "order_number",                  :null => false
    t.integer  "customer_id",                   :null => false
    t.integer  "cart_id",                       :null => false
    t.decimal  "total",        :default => 0.0, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "products", :force => true do |t|
    t.integer  "content_id",   :null => false
    t.string   "content_type", :null => false
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "shirts", :force => true do |t|
    t.string   "name"
    t.decimal  "price",      :default => 0.0, :null => false
    t.integer  "stock",      :default => 0,   :null => false
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
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
  end

end
