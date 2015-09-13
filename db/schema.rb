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

ActiveRecord::Schema.define(version: 20150913135451) do

  create_table "comments", force: :cascade do |t|
    t.string   "title",            limit: 50, default: ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "role",                        default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "jerries", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "bio"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar",     limit: 255
    t.string   "location",   limit: 255
  end

  create_table "jerries_makers", id: false, force: :cascade do |t|
    t.integer "jerry_id"
    t.integer "maker_id"
  end

  create_table "makers", force: :cascade do |t|
    t.string   "provider",    limit: 255
    t.string   "uid",         limit: 255
    t.string   "name",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "city",        limit: 255
    t.text     "bio"
    t.string   "twitter_url", limit: 255
    t.string   "website",     limit: 255
  end

  create_table "organs", force: :cascade do |t|
    t.string   "role",       limit: 255
    t.integer  "quantifier"
    t.string   "unit",       limit: 255
    t.integer  "quantity"
    t.string   "technology", limit: 255
    t.integer  "jerry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "organs", ["jerry_id"], name: "index_organs_on_jerry_id"

  create_table "skills", force: :cascade do |t|
    t.string   "layer",      limit: 255
    t.string   "name",       limit: 255
    t.string   "url",        limit: 255
    t.integer  "jerry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "skills", ["jerry_id"], name: "index_skills_on_jerry_id"

end
