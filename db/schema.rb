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

ActiveRecord::Schema.define(:version => 20101214083247) do

  create_table "accounts", :force => true do |t|
    t.string "name"
    t.string "type"
    t.string "account_type"
  end

  create_table "categories", :force => true do |t|
    t.string "name"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "executions", :force => true do |t|
    t.date    "date"
    t.integer "shares"
    t.float   "price"
    t.string  "execution_type"
    t.integer "stock_id"
    t.integer "account_id"
    t.float   "commission"
  end

  create_table "posts", :force => true do |t|
    t.text     "body"
    t.datetime "created_at"
    t.integer  "category_id"
    t.string   "title"
  end

  create_table "stock_prices", :force => true do |t|
    t.float   "price"
    t.date    "date"
    t.integer "stock_id"
  end

  create_table "stocks", :force => true do |t|
    t.string "symbol"
    t.string "company"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                             :default => "", :null => false
    t.string   "encrypted_password", :limit => 128, :default => "", :null => false
    t.string   "password_salt",                     :default => "", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
