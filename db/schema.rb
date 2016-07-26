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

ActiveRecord::Schema.define(version: 20160726142311) do

  create_table "issues", force: :cascade do |t|
    t.string   "link"
    t.boolean  "done",               default: false
    t.boolean  "available_for_test", default: false
    t.boolean  "real_problem",       default: false
    t.integer  "version_test_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "issues", ["version_test_id"], name: "index_issues_on_version_test_id"

  create_table "tests", force: :cascade do |t|
    t.text     "description"
    t.text     "settings"
    t.string   "file"
    t.text     "expected_result"
    t.string   "status"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "version_tests", force: :cascade do |t|
    t.text     "obtained_result"
    t.text     "impact"
    t.boolean  "check"
    t.integer  "version_id"
    t.integer  "test_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "version_tests", ["test_id"], name: "index_version_tests_on_test_id"
  add_index "version_tests", ["version_id"], name: "index_version_tests_on_version_id"

  create_table "versions", force: :cascade do |t|
    t.string   "responsable"
    t.string   "used_user"
    t.string   "system"
    t.text     "observation"
    t.text     "impediment"
    t.date     "start"
    t.date     "finish"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end