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

ActiveRecord::Schema.define(:version => 20130129152419) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "deal_id"
    t.integer  "user_id"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "deals", :force => true do |t|
    t.string   "name"
    t.string   "spec"
    t.string   "deliver_method"
    t.integer  "price"
    t.text     "detail"
    t.integer  "user_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "warranty"
    t.string   "accessories"
    t.string   "original_receipt"
    t.boolean  "published",        :default => false
    t.datetime "published_at"
    t.string   "category_id"
    t.string   "contact_by"
    t.string   "type_of"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
  end

  add_index "deals", ["category_id"], :name => "index_deals_on_type"

  create_table "photos", :force => true do |t|
    t.integer  "deal_id"
    t.string   "photo"
    t.integer  "photo_width"
    t.integer  "photo_height"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.integer  "photo_size"
    t.string   "photo_content_type"
    t.integer  "photo_tiny_height"
    t.integer  "photo_tiny_width"
    t.integer  "photo_tiny_size"
    t.string   "photo_tiny_content_type"
    t.integer  "photo_medium_height"
    t.integer  "photo_medium_width"
    t.integer  "photo_medium_size"
    t.string   "photo_medium_content_type"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "fb_id"
    t.string   "name"
    t.string   "cellphone",              :limit => 10
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
