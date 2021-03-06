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

ActiveRecord::Schema.define(version: 20180425012548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "behavior_condition", force: :cascade do |t|
    t.integer "behavior_id"
    t.integer "condition_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "behaviors", force: :cascade do |t|
    t.string "name"
    t.string "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "condition_id"
    t.bigint "user_id"
    t.index ["condition_id"], name: "index_behaviors_on_condition_id"
    t.index ["user_id"], name: "index_behaviors_on_user_id"
  end

  create_table "conditions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "behavior_id"
    t.index ["behavior_id"], name: "index_conditions_on_behavior_id"
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "provider_id"
    t.index ["provider_id"], name: "index_departments_on_provider_id"
  end

  create_table "insurances", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_insurances_on_user_id"
  end

  create_table "medications", force: :cascade do |t|
    t.string "name"
    t.integer "dose"
    t.string "prescribed"
    t.date "first_dose"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.integer "like"
    t.index ["user_id"], name: "index_medications_on_user_id"
  end

  create_table "provider_departments", force: :cascade do |t|
    t.integer "provider_id"
    t.integer "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.date "first_visit"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "department_id"
    t.index ["department_id"], name: "index_providers_on_department_id"
    t.index ["user_id"], name: "index_providers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "behaviors", "conditions"
  add_foreign_key "behaviors", "users"
  add_foreign_key "conditions", "behaviors"
  add_foreign_key "departments", "providers"
  add_foreign_key "insurances", "users"
  add_foreign_key "medications", "users"
  add_foreign_key "providers", "departments"
  add_foreign_key "providers", "users"
end
