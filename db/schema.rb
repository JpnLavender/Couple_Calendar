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

ActiveRecord::Schema.define(version: 20160901032238) do

  create_table "calendars", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "event_title"
    t.text     "bio"
    t.datetime "event_start"
    t.datetime "event_end"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "mail"
    t.string   "user_token"
    t.string   "password_digest"
    t.boolean  "administrator",   default: false, null: false
    t.integer  "calendar_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

end
