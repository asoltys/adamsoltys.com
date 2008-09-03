# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 12) do

  create_table "categories", :force => true do |t|
    t.string "name"
  end

  create_table "charges", :force => true do |t|
    t.date     "date"
    t.integer  "hours"
    t.string   "service"
    t.integer  "invoice_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "investments", :force => true do |t|
    t.float  "principal"
    t.float  "rate"
    t.string "type"
    t.date   "investment_date"
    t.date   "maturity_date"
  end

  create_table "invoices", :force => true do |t|
    t.integer  "project_id"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", :force => true do |t|
    t.string  "title"
    t.integer "rating"
    t.text    "comments"
    t.string  "type"
    t.integer "category_id"
  end

  create_table "stocks", :force => true do |t|
    t.string "symbol"
    t.string "company"
    t.float  "last_known_price"
  end

  create_table "transactions", :force => true do |t|
    t.date    "date"
    t.integer "shares"
    t.float   "price"
    t.integer "stock_id"
    t.string  "type",     :limit => nil
  end

end
