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

ActiveRecord::Schema.define(version: 2020_10_13_063228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "staff_infos", force: :cascade do |t|
    t.string "info"
    t.date "info_date"
    t.integer "user_id"
  end

end
