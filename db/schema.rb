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

ActiveRecord::Schema.define(version: 20140609204048) do

  create_table "jerries", force: true do |t|
    t.string   "name"
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "location"
  end

  create_table "jerries_makers", id: false, force: true do |t|
    t.integer "jerry_id"
    t.integer "maker_id"
  end

  create_table "makers", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city"
    t.text     "bio"
  end

  create_table "organs", force: true do |t|
    t.string   "role"
    t.integer  "quantifier"
    t.string   "unit"
    t.integer  "quantity"
    t.string   "technology"
    t.integer  "jerry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organs", ["jerry_id"], name: "index_organs_on_jerry_id"

  create_table "skills", force: true do |t|
    t.string   "layer"
    t.string   "name"
    t.string   "url"
    t.integer  "jerry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["jerry_id"], name: "index_skills_on_jerry_id"

end
