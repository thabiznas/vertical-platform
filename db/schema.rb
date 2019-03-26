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

ActiveRecord::Schema.define(version: 20190325200042) do

  create_table "books", force: :cascade do |t|
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "title"
    t.text     "description"
    t.text     "image"
    t.string   "amazon_link"
    t.string   "panamericana_link"
  end

  create_table "contacts", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phonenumber"
    t.text     "message"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "movies", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "title"
    t.text     "description"
    t.string   "genre"
    t.string   "image"
    t.string   "netflix_link"
  end

  create_table "plans", force: :cascade do |t|
    t.string   "payment_plan_gateway_identifier"
    t.string   "name"
    t.integer  "price_cents",                     default: 0,     null: false
    t.string   "price_currency",                  default: "USD", null: false
    t.integer  "interval"
    t.integer  "interval_count"
    t.integer  "status"
    t.text     "description"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  create_table "songs", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "title"
    t.string   "artist"
    t.string   "genre"
    t.string   "youtube_link"
    t.string   "spotify_link"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "plan_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "status"
    t.string   "payment_gateway"
    t.string   "payment_gateway_subscription_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "subscriptions", ["plan_id"], name: "index_subscriptions_on_plan_id"
  add_index "subscriptions", ["user_id"], name: "index_subscriptions_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "admin",                  default: false
    t.boolean  "teacher",                default: false
    t.boolean  "inactive",               default: false
    t.text     "teacher_schedule"
    t.string   "stripe_id"
    t.string   "stripe_subscription_id"
    t.string   "card_last4"
    t.integer  "card_exp_month"
    t.integer  "card_exp_year"
    t.boolean  "subscribed"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
