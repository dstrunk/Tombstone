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

ActiveRecord::Schema.define(version: 20150222181102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "aura_transitions", force: :cascade do |t|
    t.string   "to_state",   limit: 255,                null: false
    t.text     "metadata",               default: "{}"
    t.integer  "sort_key",                              null: false
    t.integer  "aura_id",                               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "aura_transitions", ["aura_id"], name: "index_aura_transitions_on_aura_id", using: :btree
  add_index "aura_transitions", ["sort_key", "aura_id"], name: "index_aura_transitions_on_sort_key_and_aura_id", unique: true, using: :btree

  create_table "auras", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "job_number_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.text     "description"
    t.integer  "customer_id"
    t.boolean  "ongoing",                   default: false
    t.integer  "user_id"
  end

  add_index "auras", ["job_number_id"], name: "index_auras_on_job_number_id", using: :btree
  add_index "auras", ["user_id"], name: "index_auras_on_user_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_numbers", force: :cascade do |t|
    t.integer  "number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.boolean  "admin",                          default: false, null: false
    t.string   "email",              limit: 255,                 null: false
    t.string   "encrypted_password", limit: 128,                 null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128,                 null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
