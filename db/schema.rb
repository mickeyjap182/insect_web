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

ActiveRecord::Schema.define(version: 2018_12_05_173856) do

  create_table "sensors", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.integer "cls"
    t.string "explanation"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cls"], name: "index_sensors_on_cls"
    t.index ["user_id"], name: "index_sensors_on_user_id"
  end

  create_table "temp_humidities", force: :cascade do |t|
    t.integer "sensor_id"
    t.float "temp"
    t.float "humidity"
    t.datetime "inspected_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inspected_at"], name: "index_temp_humidities_on_inspected_at"
    t.index ["sensor_id"], name: "index_temp_humidities_on_sensor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "nickname"
    t.string "email"
    t.date "birthday"
    t.text "password"
    t.integer "status"
    t.integer "cls"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
  end

end
