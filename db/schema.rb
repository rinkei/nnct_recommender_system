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

ActiveRecord::Schema.define(version: 20131126141350) do

  create_table "items", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "introduction"
    t.text     "aim"
    t.string   "grade"
  end

  create_table "ratings", force: true do |t|
    t.integer  "item_id"
    t.integer  "user_id"
    t.string   "type"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "touch_id"
  end

  add_index "ratings", ["item_id"], name: "index_ratings_on_item_id"
  add_index "ratings", ["touch_id"], name: "index_ratings_on_touch_id"
  add_index "ratings", ["user_id"], name: "index_ratings_on_user_id"

  create_table "seeings", force: true do |t|
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "touch_id"
  end

  create_table "touches", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "touches", ["item_id"], name: "index_touches_on_item_id"
  add_index "touches", ["user_id"], name: "index_touches_on_user_id"

  create_table "user_similarities", force: true do |t|
    t.integer  "user_id"
    t.integer  "target_id"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_similarities", ["target_id"], name: "index_user_similarities_on_target_id"
  add_index "user_similarities", ["user_id"], name: "index_user_similarities_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
