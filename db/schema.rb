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

ActiveRecord::Schema.define(version: 20150701171219) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "booking_spots", force: :cascade do |t|
    t.integer  "spot_id"
    t.integer  "booking_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "booking_spots", ["booking_id"], name: "index_booking_spots_on_booking_id", using: :btree
  add_index "booking_spots", ["spot_id"], name: "index_booking_spots_on_spot_id", using: :btree

  create_table "bookings", force: :cascade do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.date     "date"
    t.integer  "pax"
    t.integer  "restaurant_id"
    t.integer  "customer_id"
    t.integer  "waiter_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "status"
    t.text     "notes"
    t.string   "service"
    t.string   "period"
  end

  add_index "bookings", ["customer_id"], name: "index_bookings_on_customer_id", using: :btree
  add_index "bookings", ["restaurant_id"], name: "index_bookings_on_restaurant_id", using: :btree
  add_index "bookings", ["waiter_id"], name: "index_bookings_on_waiter_id", using: :btree

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone_number"
    t.boolean  "vip"
    t.string   "status"
    t.string   "gender"
    t.text     "comments"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "restaurant_customers", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "customer_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "restaurant_customers", ["customer_id"], name: "index_restaurant_customers_on_customer_id", using: :btree
  add_index "restaurant_customers", ["restaurant_id"], name: "index_restaurant_customers_on_restaurant_id", using: :btree

  create_table "restaurant_users", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "restaurant_users", ["restaurant_id"], name: "index_restaurant_users_on_restaurant_id", using: :btree
  add_index "restaurant_users", ["user_id"], name: "index_restaurant_users_on_user_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "city"
    t.string   "street"
    t.string   "zip_code"
    t.integer  "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "spots", force: :cascade do |t|
    t.integer  "capacity"
    t.string   "name"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "spots", ["restaurant_id"], name: "index_spots_on_restaurant_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "waiters", force: :cascade do |t|
    t.string   "name"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "waiters", ["restaurant_id"], name: "index_waiters_on_restaurant_id", using: :btree

  add_foreign_key "booking_spots", "bookings"
  add_foreign_key "booking_spots", "spots"
  add_foreign_key "bookings", "customers"
  add_foreign_key "bookings", "restaurants"
  add_foreign_key "bookings", "waiters"
  add_foreign_key "restaurant_customers", "customers"
  add_foreign_key "restaurant_customers", "restaurants"
  add_foreign_key "restaurant_users", "restaurants"
  add_foreign_key "restaurant_users", "users"
  add_foreign_key "spots", "restaurants"
  add_foreign_key "waiters", "restaurants"
end
