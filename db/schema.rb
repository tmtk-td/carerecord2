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

ActiveRecord::Schema.define(version: 2020_10_14_121542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "care_record_labels", force: :cascade do |t|
    t.bigint "care_record_id"
    t.bigint "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["care_record_id"], name: "index_care_record_labels_on_care_record_id"
    t.index ["label_id"], name: "index_care_record_labels_on_label_id"
  end

  create_table "care_records", force: :cascade do |t|
    t.string "content"
    t.date "content_date"
    t.integer "user_id"
    t.integer "client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "sex"
    t.date "born_on"
    t.integer "age"
    t.string "information"
    t.string "image"
    t.integer "user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "care_record_id"
    t.text "addcontent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["care_record_id"], name: "index_comments_on_care_record_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "title"
  end

  create_table "staff_infos", force: :cascade do |t|
    t.string "info"
    t.date "info_date"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "care_record_labels", "care_records"
  add_foreign_key "care_record_labels", "labels"
  add_foreign_key "comments", "care_records"
end
