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

ActiveRecord::Schema.define(:version => 20130607011642) do

  create_table "customer_prices", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "product_id"
    t.float    "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "customer_prices", ["customer_id"], :name => "index_customer_prices_on_customer_id"
  add_index "customer_prices", ["product_id"], :name => "index_customer_prices_on_product_id"

  create_table "customer_stocks", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "customer_stocks", ["customer_id"], :name => "index_customer_stocks_on_customer_id"
  add_index "customer_stocks", ["product_id"], :name => "index_customer_stocks_on_product_id"

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "cpf_cnpj"
    t.string   "municipal_number"
    t.string   "suframa"
    t.string   "tribute"
    t.string   "addres"
    t.string   "city"
    t.string   "state"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "fax"
    t.string   "mobile"
    t.string   "email"
    t.integer  "user_id"
    t.text     "observations"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.float    "discount"
  end

  create_table "events", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "events", ["user_id"], :name => "index_events_on_user_id"

  create_table "feedstock_by_products", :force => true do |t|
    t.integer  "feedstock_id"
    t.integer  "product_id"
    t.decimal  "quantity"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "feedstock_by_products", ["feedstock_id"], :name => "index_feedstock_by_products_on_feedstock_id"
  add_index "feedstock_by_products", ["product_id"], :name => "index_feedstock_by_products_on_product_id"

  create_table "feedstock_stocks", :force => true do |t|
    t.integer  "feedstock_id"
    t.decimal  "quantity"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "feedstock_stocks", ["feedstock_id"], :name => "index_feedstock_stocks_on_feedstock_id"

  create_table "feedstocks", :force => true do |t|
    t.string   "name"
    t.string   "unity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "filial_stocks", :force => true do |t|
    t.integer  "filial_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "filial_stocks", ["filial_id"], :name => "index_filial_stocks_on_filial_id"
  add_index "filial_stocks", ["product_id"], :name => "index_filial_stocks_on_product_id"

  create_table "filials", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "functions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "functions_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "function_id"
  end

  create_table "manage_filial_stocks", :force => true do |t|
    t.integer  "quantity"
    t.integer  "product_id"
    t.integer  "filial_id"
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "manage_filial_stocks", ["filial_id"], :name => "index_manage_filial_stocks_on_filial_id"
  add_index "manage_filial_stocks", ["product_id"], :name => "index_manage_filial_stocks_on_product_id"

  create_table "order_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "order_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "orders", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "user_id"
    t.integer  "order_status_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "order_type_id"
  end

  add_index "orders", ["customer_id"], :name => "index_orders_on_customer_id"
  add_index "orders", ["order_status_id"], :name => "index_orders_on_order_status_id"
  add_index "orders", ["order_type_id"], :name => "index_orders_on_order_type_id"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "product_bases", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.float    "price"
    t.string   "code"
  end

  create_table "product_order_outs", :force => true do |t|
    t.integer  "product_order_id"
    t.integer  "quantity"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.integer  "production_item_id"
    t.integer  "product_id"
  end

  add_index "product_order_outs", ["product_id"], :name => "index_product_order_outs_on_product_id"
  add_index "product_order_outs", ["product_order_id"], :name => "index_product_order_outs_on_product_order_id"
  add_index "product_order_outs", ["production_item_id"], :name => "index_product_order_outs_on_production_item_id"

  create_table "product_orders", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "status"
  end

  add_index "product_orders", ["order_id"], :name => "index_product_orders_on_order_id"
  add_index "product_orders", ["product_id"], :name => "index_product_orders_on_product_id"

  create_table "product_stocks", :force => true do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "product_stocks", ["product_id"], :name => "index_product_stocks_on_product_id"

  create_table "production_items", :force => true do |t|
    t.integer  "production_status_id"
    t.integer  "order_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "production_items", ["order_id"], :name => "index_production_items_on_order_id"
  add_index "production_items", ["production_status_id"], :name => "index_production_items_on_production_status_id"

  create_table "production_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "color"
    t.string   "size"
    t.integer  "line"
    t.string   "description"
    t.integer  "product_base_id"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "customer_stock_id"
    t.integer  "quantity"
    t.float    "value"
    t.boolean  "is_devolution"
    t.datetime "create_at"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "transactions", ["customer_stock_id"], :name => "index_transactions_on_customer_stock_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "rg"
    t.string   "cpf"
    t.date     "dateofbirth"
    t.string   "sex"
    t.date     "hide_date"
    t.date     "fire_date"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "cep"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "cel_number"
    t.float    "wage"
    t.text     "observations"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "login"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
