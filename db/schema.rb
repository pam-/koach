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

ActiveRecord::Schema.define(version: 2019_03_04_022248) do

  create_table "appointments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "coach_id"
    t.bigint "client_id"
    t.boolean "is_confirmed"
    t.bigint "time_slot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_appointments_on_client_id"
    t.index ["coach_id"], name: "index_appointments_on_coach_id"
    t.index ["time_slot_id"], name: "index_appointments_on_time_slot_id"
  end

  create_table "time_slots", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.time "from"
    t.time "to"
    t.string "timezone"
    t.string "day"
    t.bigint "coach_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_open"
    t.index ["coach_id"], name: "index_time_slots_on_coach_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.boolean "is_coach"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "appointments", "users", column: "client_id"
  add_foreign_key "appointments", "users", column: "coach_id"
  add_foreign_key "time_slots", "users", column: "coach_id"
end
