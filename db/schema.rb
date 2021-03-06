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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20141106092120) do

  create_table "attendances", force: true do |t|
    t.integer  "event_id"
    t.integer  "user_id"
    t.integer  "children_number"
    t.integer  "adults_number"
    t.string   "username"
    t.string   "phone_number"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", force: true do |t|
    t.integer  "agent_id"
    t.integer  "event_id"
    t.string   "data_file_name",               null: false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "events", force: true do |t|
    t.integer  "agent_id"
    t.string   "title"
    t.string   "category"
    t.string   "abstract"
    t.text     "content"
    t.string   "main_image_url"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string   "contact_phone"
    t.string   "address"
    t.boolean  "is_published",   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["contact_phone"], name: "index_events_on_contact_phone", using: :btree
  add_index "events", ["title"], name: "index_events_on_title", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", using: :btree

end
