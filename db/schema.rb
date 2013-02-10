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

ActiveRecord::Schema.define(:version => 20130210202806) do

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
  end

  create_table "functions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_functions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "function_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "user_functions", ["function_id"], :name => "index_user_functions_on_function_id"
  add_index "user_functions", ["user_id"], :name => "index_user_functions_on_user_id"

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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "users_functions", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "function_id"
  end

end
