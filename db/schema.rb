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

ActiveRecord::Schema.define(version: 20151012102527) do

  create_table "activities", force: true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "device_queues", force: true do |t|
    t.integer  "device_id"
    t.integer  "user_id"
    t.datetime "time"
    t.datetime "return_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "device_types", force: true do |t|
    t.string   "device_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: true do |t|
    t.string   "name"
    t.string   "device_type"
    t.string   "slug"
    t.integer  "status_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner"
  end

  create_table "notifications", force: true do |t|
    t.integer  "user_id"
    t.integer  "sender_id"
    t.string   "description"
    t.integer  "activity_id"
    t.integer  "request_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "seen"
    t.boolean  "open"
    t.string   "userdescription"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "request_statuses", force: true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "requests", force: true do |t|
    t.integer  "sender_id"
    t.integer  "reciever_id"
    t.integer  "status_id"
    t.integer  "device_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: true do |t|
    t.string   "status_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_infos", force: true do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.date     "dob"
    t.binary   "image",       limit: 10485760
    t.string   "image_name"
    t.string   "department"
    t.string   "designation"
    t.integer  "phone"
    t.string   "gender"
    t.string   "city"
    t.integer  "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.integer  "is_admin"
    t.string   "username"
    t.string   "address"
    t.string   "city"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
