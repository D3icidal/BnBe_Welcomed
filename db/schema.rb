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

ActiveRecord::Schema.define(version: 2018_11_25_203128) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amenities", force: :cascade do |t|
    t.string "name"
    t.string "icon_url"
    t.text "instructions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "location"
    t.boolean "is_usable"
    t.integer "home_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "home_id"
    t.date "checkin"
    t.date "checkout"
    t.string "checkout_reason"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "guestbook_comments", force: :cascade do |t|
    t.integer "home_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.text "comment"
  end

  create_table "home_amenities", force: :cascade do |t|
    t.integer "home_id"
    t.integer "amenity_id"
    t.boolean "is_usable"
    t.string "location"
    t.text "instructions"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "homes", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.string "is_active"
    t.string "wifi_password"
    t.string "guest_password"
    t.string "street_address"
    t.string "zipcode"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "comment_id"
    t.string "state"
  end

  create_table "images", force: :cascade do |t|
    t.integer "home_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "url"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.text "bio"
    t.string "image_url"
    t.string "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
