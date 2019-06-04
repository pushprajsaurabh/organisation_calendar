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

ActiveRecord::Schema.define(version: 20190531071204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employee_meetings", force: :cascade do |t|
    t.integer  "employee_id",     null: false
    t.integer  "meeting_id",      null: false
    t.datetime "invited_at_time", null: false
  end

  add_index "employee_meetings", ["employee_id"], name: "index_employee_meetings_on_employee_id", using: :btree
  add_index "employee_meetings", ["meeting_id"], name: "index_employee_meetings_on_meeting_id", using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "email_id",    null: false
    t.string   "employee_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "employees", ["email_id"], name: "index_employees_on_email_id", using: :btree
  add_index "employees", ["employee_id"], name: "index_employees_on_employee_id", using: :btree
  add_index "employees", ["name"], name: "index_employees_on_name", using: :btree

  create_table "meeting_rooms", force: :cascade do |t|
    t.string  "name",                     null: false
    t.text    "information"
    t.integer "capacity",    default: 10
  end

  add_index "meeting_rooms", ["capacity"], name: "index_meeting_rooms_on_capacity", using: :btree
  add_index "meeting_rooms", ["name"], name: "index_meeting_rooms_on_name", unique: true, using: :btree

  create_table "meetings", force: :cascade do |t|
    t.string   "title",                          null: false
    t.text     "description"
    t.datetime "start_time",                     null: false
    t.datetime "end_time",                       null: false
    t.integer  "duration_minutes",               null: false
    t.integer  "total_participants", default: 0, null: false
    t.integer  "host_id",                        null: false
    t.integer  "meeting_room_id",                null: false
  end

  add_index "meetings", ["end_time"], name: "index_meetings_on_end_time", using: :btree
  add_index "meetings", ["host_id"], name: "index_meetings_on_host_id", using: :btree
  add_index "meetings", ["meeting_room_id"], name: "index_meetings_on_meeting_room_id", using: :btree
  add_index "meetings", ["start_time"], name: "index_meetings_on_start_time", using: :btree

end
