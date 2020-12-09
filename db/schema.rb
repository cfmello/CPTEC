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

ActiveRecord::Schema.define(version: 2020_12_09_201020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "experts", force: :cascade do |t|
    t.string "doc_number"
    t.string "phone_number"
    t.string "city"
    t.integer "distance"
    t.string "curriculum"
    t.boolean "active"
    t.integer "accept"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_experts_on_user_id"
  end

  create_table "fields", force: :cascade do |t|
    t.string "title"
    t.string "area"
    t.string "reg_number"
    t.bigint "expert_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expert_id"], name: "index_fields_on_expert_id"
  end

  create_table "investigations", force: :cascade do |t|
    t.string "proc_number"
    t.float "cost"
    t.date "call_date"
    t.bigint "expert_id", null: false
    t.bigint "servant_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["expert_id"], name: "index_investigations_on_expert_id"
    t.index ["servant_id"], name: "index_investigations_on_servant_id"
  end

  create_table "servants", force: :cascade do |t|
    t.string "court"
    t.string "city"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_servants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "full_name"
    t.string "profile"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "experts", "users"
  add_foreign_key "fields", "experts"
  add_foreign_key "investigations", "experts"
  add_foreign_key "investigations", "servants"
  add_foreign_key "servants", "users"
end
