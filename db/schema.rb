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

ActiveRecord::Schema.define(version: 20171021134129) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.index ["organization_id"], name: "index_admins_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.string "url"
    t.string "logo_url"
    t.string "display_name", null: false
    t.string "org_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "content_credit"
  end

  create_table "photos", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.bigint "tour_id"
    t.bigint "stop_id"
    t.index ["organization_id"], name: "index_photos_on_organization_id"
    t.index ["stop_id"], name: "index_photos_on_stop_id"
    t.index ["tour_id"], name: "index_photos_on_tour_id"
  end

  create_table "stops", force: :cascade do |t|
    t.integer "stop_num", null: false
    t.string "name", null: false
    t.string "directions_to_next_stop"
    t.string "learn_more_URL"
    t.text "travel_tip"
    t.text "description"
    t.string "location", null: false
    t.string "image_current"
    t.string "image_historic"
    t.float "gps_long", default: 0.0
    t.float "gps_lat", default: 0.0
    t.string "badge"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tour_id"
    t.bigint "admin_id"
    t.string "image"
    t.string "attachments", default: [], array: true
    t.index ["admin_id"], name: "index_stops_on_admin_id"
    t.index ["tour_id"], name: "index_stops_on_tour_id"
  end

  create_table "tours", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.string "main_tour_photo"
    t.float "distance", default: 0.0
    t.integer "time_in_mins", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id"
    t.bigint "admin_id"
    t.index ["admin_id"], name: "index_tours_on_admin_id"
    t.index ["organization_id"], name: "index_tours_on_organization_id"
  end

  add_foreign_key "admins", "organizations"
  add_foreign_key "photos", "organizations"
  add_foreign_key "photos", "stops"
  add_foreign_key "photos", "tours"
  add_foreign_key "stops", "admins"
  add_foreign_key "stops", "tours"
  add_foreign_key "tours", "admins"
  add_foreign_key "tours", "organizations"
end
