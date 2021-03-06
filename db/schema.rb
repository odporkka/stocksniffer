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

ActiveRecord::Schema.define(version: 4) do

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority"
  end

  create_table "finance_objects", force: :cascade do |t|
    t.string   "owner_instrument_type"
    t.integer  "owner_instrument_id"
    t.float    "close"
    t.float    "open"
    t.float    "mkt_cap"
    t.float    "shares"
    t.float    "t_pe"
    t.float    "f_pe"
    t.float    "eps"
    t.float    "beta"
    t.float    "inst_own"
    t.float    "high52"
    t.float    "low52"
    t.string   "range"
    t.string   "vol_per_avg"
    t.string   "div_per_yield"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["owner_instrument_type", "owner_instrument_id"], name: "index_owner_instrument_on_finance_object"
  end

  create_table "nasdaq_instruments", force: :cascade do |t|
    t.string   "name"
    t.string   "symbol"
    t.string   "exchange"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "xetra_instruments", force: :cascade do |t|
    t.string   "name"
    t.string   "isin"
    t.string   "symbol"
    t.string   "exchange"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
