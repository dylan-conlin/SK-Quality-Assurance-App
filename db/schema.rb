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

ActiveRecord::Schema.define(:version => 20120803233534) do

  create_table "assets", :force => true do |t|
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_update_at"
    t.integer  "instance_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "audits", :force => true do |t|
    t.integer  "user_id"
    t.string   "dishwasher"
    t.string   "cutting_tools"
    t.string   "tunnel_temperature"
    t.string   "sanitizer"
    t.string   "data_collection"
    t.string   "mps"
    t.string   "metal_detection"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.datetime "dishwasher_time"
    t.datetime "cutting_tools_time"
    t.datetime "tunnel_temperature_time"
    t.datetime "sanitizer_time"
    t.datetime "data_collection_time"
    t.datetime "mps_time"
    t.datetime "metal_detection_time"
    t.string   "map"
    t.datetime "map_time"
    t.string   "gmp"
    t.datetime "gmp_time"
    t.string   "packaging"
    t.datetime "packaging_time"
  end

  create_table "celebrities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "content"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "user_id"
  end

  add_index "comments", ["commentable_id", "commentable_type"], :name => "index_comments_on_commentable_id_and_commentable_type"

  create_table "components", :force => true do |t|
    t.string   "number"
    t.string   "status"
    t.string   "sk_description"
    t.string   "supplier_number"
    t.string   "minimum_po_quantity"
    t.string   "purchase_unit"
    t.string   "stock_unit"
    t.integer  "pur_stk_conversion"
    t.decimal  "price_per_stock_unit"
    t.decimal  "price_per_purchase_unit"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "supplier_description"
    t.integer  "supplier_id"
    t.integer  "link_id"
  end

  create_table "customers", :force => true do |t|
    t.string   "short_name"
    t.string   "long_name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "documents", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "foreign_objects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "gmps", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "infractions", :force => true do |t|
    t.integer  "user_id"
    t.text     "description"
    t.date     "date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "instances", :force => true do |t|
    t.integer  "nonconformance_id"
    t.integer  "user_id"
    t.string   "workorder"
    t.string   "lot"
    t.string   "sublot"
    t.integer  "quantity"
    t.string   "units"
    t.string   "location"
    t.integer  "labor"
    t.string   "labor_units"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "stocker_id"
    t.string   "supplier_lot"
    t.string   "po_number"
    t.date     "receipt_date"
  end

  create_table "issues", :force => true do |t|
    t.integer  "department_id"
    t.integer  "gmp_id"
    t.integer  "user_id"
    t.text     "description"
    t.string   "workorder"
    t.integer  "foreign_object_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.text     "corrective_action"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.decimal  "score"
  end

  create_table "items", :force => true do |t|
    t.string   "number"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "customer_id"
  end

  create_table "microposts", :force => true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "nonconformances", :force => true do |t|
    t.integer  "user_id"
    t.text     "reason"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "status"
    t.integer  "component_id"
    t.decimal  "labor_cost"
    t.string   "photo_1_file_name"
    t.string   "photo_1_content_type"
    t.integer  "photo_1_file_size"
    t.datetime "photo_1_updated_at"
    t.string   "photo_2_file_name"
    t.string   "photo_2_content_type"
    t.integer  "photo_2_file_size"
    t.datetime "photo_2_updated_at"
    t.string   "photo_3_file_name"
    t.string   "photo_3_content_type"
    t.integer  "photo_3_file_size"
    t.datetime "photo_3_updated_at"
    t.string   "photo_4_file_name"
    t.string   "photo_4_content_type"
    t.integer  "photo_4_file_size"
    t.datetime "photo_4_updated_at"
  end

  create_table "packagings", :force => true do |t|
    t.integer  "user_id"
    t.string   "workorder"
    t.boolean  "individual_label_placement"
    t.boolean  "individual_label_legibility"
    t.boolean  "individual_seal_integrity"
    t.boolean  "individual_label_accuracy"
    t.boolean  "individual_general_appearance"
    t.boolean  "master_label_placement"
    t.boolean  "master_label_legibility"
    t.boolean  "master_tape_glue"
    t.boolean  "master_case_appearance"
    t.integer  "case_count"
    t.decimal  "case_weight"
    t.text     "comments"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "item_id"
  end

  create_table "production_checks", :force => true do |t|
    t.integer  "user_id"
    t.string   "workorder"
    t.boolean  "label_readability"
    t.boolean  "label_accuracy"
    t.boolean  "seal_integrity"
    t.boolean  "build_accuracy"
    t.text     "comments"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "recipient_id"
  end

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "long_name"
    t.string   "contact_name"
    t.string   "contact_email"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "tunneltemps", :force => true do |t|
    t.integer  "user_id"
    t.string   "tunnel"
    t.string   "item"
    t.decimal  "temperature"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                         :null => false
    t.datetime "updated_at",                                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",                           :default => false
    t.integer  "department_id"
    t.integer  "user_id"
    t.boolean  "supervisor"
    t.string   "title"
    t.date     "hire_date"
    t.boolean  "nc_admin"
    t.boolean  "receives_production_check_alert"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

  create_table "users_table", :id => false, :force => true do |t|
    t.integer "id"
    t.text    "name"
  end

  create_table "versions", :force => true do |t|
    t.integer  "versioned_id"
    t.string   "versioned_type"
    t.integer  "user_id"
    t.string   "user_type"
    t.string   "user_name"
    t.text     "modifications"
    t.integer  "number"
    t.integer  "reverted_from"
    t.string   "tag"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "versions", ["created_at"], :name => "index_versions_on_created_at"
  add_index "versions", ["number"], :name => "index_versions_on_number"
  add_index "versions", ["tag"], :name => "index_versions_on_tag"
  add_index "versions", ["user_id", "user_type"], :name => "index_versions_on_user_id_and_user_type"
  add_index "versions", ["user_name"], :name => "index_versions_on_user_name"
  add_index "versions", ["versioned_id", "versioned_type"], :name => "index_versions_on_versioned_id_and_versioned_type"

end
