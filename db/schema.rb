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

ActiveRecord::Schema.define(version: 2019_10_25_013740) do

  create_table "laboratories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "displayname", default: "", null: false
    t.integer "place", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.datetime "remember_created_at"
    t.datetime "last_updated_at", default: "2019-10-25 02:02:05", null: false
    t.index ["email"], name: "index_laboratories_on_email", unique: true
    t.index ["name"], name: "index_laboratories_on_name", unique: true
  end

  create_table "logs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "total_time", default: 0, null: false
    t.integer "status", null: false
    t.bigint "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_logs_on_member_id"
  end

  create_table "members", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "firstname", default: "", null: false
    t.string "lastname", default: "", null: false
    t.integer "grade", null: false
    t.integer "status", null: false
    t.datetime "changed_at", null: false
    t.boolean "go_cafeteria", default: true, null: false
    t.bigint "laboratory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "class_number", default: 0, null: false
    t.index ["laboratory_id"], name: "index_members_on_laboratory_id"
  end

  add_foreign_key "logs", "members"
  add_foreign_key "members", "laboratories"
end
