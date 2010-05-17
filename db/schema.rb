# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100404201828) do

  create_table "assignments", :force => true do |t|
    t.integer  "business_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "businesses", :force => true do |t|
    t.string   "name",                            :null => false
    t.string   "street"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode",            :limit => 8
    t.string   "email"
    t.string   "website"
    t.integer  "fax",                :limit => 8
    t.integer  "owner_id",                        :null => false
    t.integer  "phone",              :limit => 8
    t.string   "subdomain",                       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "consigner_businesses", :force => true do |t|
    t.integer  "consigner_id"
    t.integer  "business_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "consigners", :force => true do |t|
    t.string   "name",                       :null => false
    t.string   "biz_name"
    t.string   "street"
    t.string   "street_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "phone"
    t.string   "email"
    t.string   "website"
    t.string   "fax"
    t.text     "notes"
    t.integer  "percentage", :default => 65, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invoice_id"
  end

  create_table "invitations", :force => true do |t|
    t.integer  "sender_id"
    t.string   "recipient_email"
    t.string   "token"
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", :force => true do |t|
    t.integer  "business_id",  :null => false
    t.integer  "consigner_id", :null => false
    t.date     "date",         :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", :force => true do |t|
    t.string   "code",         :null => false
    t.string   "name"
    t.text     "description"
    t.float    "wholesale",    :null => false
    t.float    "retail",       :null => false
    t.integer  "consigner_id", :null => false
    t.integer  "business_id",  :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "taggable_type"
    t.string   "context"
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
  add_index "taggings", ["taggable_id", "taggable_type", "context"], :name => "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "transaction_types", :force => true do |t|
    t.string   "noun",       :null => false
    t.string   "verb",       :null => false
    t.string   "past",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "transactions", :force => true do |t|
    t.integer  "business_id",                        :null => false
    t.integer  "product_id",                         :null => false
    t.integer  "transaction_type_id", :default => 1, :null => false
    t.float    "wholesale",                          :null => false
    t.float    "retail",                             :null => false
    t.integer  "invoice_id",          :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email",                            :null => false
    t.string   "persistence_token",                :null => false
    t.string   "crypted_password",                 :null => false
    t.string   "password_salt",                    :null => false
    t.integer  "login_count",       :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "last_login_at"
    t.datetime "current_login_at"
    t.string   "last_login_ip"
    t.string   "current_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "invitation_id"
    t.integer  "invitation_limit"
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
