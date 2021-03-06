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

ActiveRecord::Schema.define(version: 20140721002146) do

  create_table "basic_informations", force: true do |t|
    t.string   "name",             limit: 60
    t.string   "information_type", limit: 60
    t.string   "value",            limit: 256
    t.string   "description",      limit: 256
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type",             limit: 60
  end

  create_table "id_informations", force: true do |t|
    t.string   "first_name", limit: 90
    t.string   "last_name",  limit: 90
    t.binary   "photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists", id: false, force: true do |t|
    t.integer "list_item_id",        default: 0, null: false
    t.integer "superinformation_id", default: 0, null: false
    t.integer "ordinal",             default: 0, null: false
  end

  add_index "lists", ["list_item_id"], name: "index_lists_on_list_item_id", unique: true
  add_index "lists", ["superinformation_id", "ordinal"], name: "order_in_lists", unique: true
  add_index "lists", ["superinformation_id"], name: "index_lists_on_superinformation_id"

  create_table "time_ranges", id: false, force: true do |t|
    t.integer "information_id", default: 0, null: false
    t.date    "begin"
    t.date    "end"
  end

  add_index "time_ranges", ["information_id"], name: "index_time_ranges_on_information_id", unique: true

end
