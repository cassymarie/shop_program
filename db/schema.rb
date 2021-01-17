# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_15_144522) do

  create_table "builds", force: :cascade do |t|
    t.date "date_received"
    t.integer "job_id"
    t.string "subjob_code"
    t.string "description"
    t.integer "location_id"
    t.integer "status_id"
    t.string "pc_ct"
    t.string "notes"
    t.string "to_number"
    t.decimal "weight"
    t.string "liner"
    t.integer "sq_ft"
    t.string "dept"
    t.string "completion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "deliveries", force: :cascade do |t|
    t.date "delivery_date"
    t.date "scheduled_date"
    t.integer "build_id"
    t.integer "order_id"
    t.integer "truck_id"
    t.string "notes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "job_number"
    t.string "name"
    t.string "manager"
    t.string "foreman"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.string "um"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date "date_received"
    t.string "description"
    t.string "po_number"
    t.string "ticket_number"
    t.string "vendor"
    t.string "pc_ct"
    t.string "notes"
    t.integer "location_id"
    t.integer "job_id"
    t.string "subjob_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "statuses", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "trucks", force: :cascade do |t|
    t.string "description"
    t.string "make"
    t.string "model"
    t.boolean "accepts_cage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "used_materials", force: :cascade do |t|
    t.integer "job_id"
    t.string "subjob_code"
    t.integer "material_id"
    t.decimal "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "uid"
    t.string "provider"
    t.string "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
