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

ActiveRecord::Schema.define(version: 2019_02_14_123032) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients_custom_lists", force: :cascade do |t|
    t.integer "custom_list_id"
    t.integer "client_id"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_clients_custom_lists_on_client_id"
    t.index ["custom_list_id", "client_id"], name: "index_clients_custom_lists_on_custom_list_id_and_client_id", unique: true
    t.index ["custom_list_id"], name: "index_clients_custom_lists_on_custom_list_id"
  end

  create_table "custom_lists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "custom_lists_people", id: false, force: :cascade do |t|
    t.bigint "custom_list_id", null: false
    t.bigint "person_id", null: false
  end

  create_table "federal_legislators", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "facebook_id"
    t.string "twitter_username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
