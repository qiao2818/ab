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

ActiveRecord::Schema.define(version: 20140603054034) do

  create_table "ab_infos", force: true do |t|
    t.integer  "concurrency_num"
    t.integer  "request_num"
    t.integer  "response_time"
    t.string   "url"
    t.string   "src"
    t.string   "target"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "run_time"
  end

  create_table "logs", force: true do |t|
    t.integer  "concurrency_num"
    t.integer  "request_num"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "src"
    t.string   "target"
    t.integer  "url_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "response_time"
  end

  create_table "urls", force: true do |t|
    t.text     "url"
    t.integer  "enable"
    t.integer  "need_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
