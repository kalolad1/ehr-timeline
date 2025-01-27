# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_25_020535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.integer "event_type"
    t.datetime "created_at"
    t.integer "patient_id"
    t.integer "provider_id"
    t.string "note"
    t.boolean "is_included"
  end

  create_table "patients", force: :cascade do |t|
    t.string "name"
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "name"
    t.integer "priority"
    t.integer "event_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.string "name"
    t.integer "priority"
    t.integer "event_id"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.integer "provider_type"
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "name"
    t.integer "priority"
    t.integer "event_id"
  end

end
