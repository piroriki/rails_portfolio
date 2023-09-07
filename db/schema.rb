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

ActiveRecord::Schema[7.0].define(version: 2023_09_07_090339) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "baths", force: :cascade do |t|
    t.datetime "time", null: false
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_baths_on_user_id"
  end

  create_table "diaries", force: :cascade do |t|
    t.text "title", null: false
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_diaries_on_user_id"
  end

  create_table "diary_tag_relations", force: :cascade do |t|
    t.bigint "diary_id", null: false
    t.bigint "diary_tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["diary_id"], name: "index_diary_tag_relations_on_diary_id"
    t.index ["diary_tag_id"], name: "index_diary_tag_relations_on_diary_tag_id"
  end

  create_table "diary_tags", force: :cascade do |t|
    t.string "tag_name", limit: 50, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "execretions", force: :cascade do |t|
    t.string "kinds", null: false
    t.datetime "time", null: false
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_execretions_on_user_id"
  end

  create_table "head_circumferences", force: :cascade do |t|
    t.float "circumference", null: false
    t.datetime "time", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_head_circumferences_on_user_id"
  end

  create_table "heights", force: :cascade do |t|
    t.float "height", null: false
    t.datetime "time", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_heights_on_user_id"
  end

  create_table "meals", force: :cascade do |t|
    t.string "kinds", null: false
    t.text "amount", null: false
    t.datetime "time", null: false
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "medicines", force: :cascade do |t|
    t.datetime "time", null: false
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_medicines_on_user_id"
  end

  create_table "milks", force: :cascade do |t|
    t.string "kinds", null: false
    t.integer "amount", null: false
    t.datetime "time", null: false
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_milks_on_user_id"
  end

  create_table "symptoms", force: :cascade do |t|
    t.string "kinds", null: false
    t.datetime "time", null: false
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_symptoms_on_user_id"
  end

  create_table "temperatures", force: :cascade do |t|
    t.integer "temperature", null: false
    t.datetime "time", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_temperatures_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "vaccinations", force: :cascade do |t|
    t.string "kinds", null: false
    t.datetime "time", null: false
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_vaccinations_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "baths", "users"
  add_foreign_key "diaries", "users"
  add_foreign_key "diary_tag_relations", "diaries"
  add_foreign_key "diary_tag_relations", "diary_tags"
  add_foreign_key "execretions", "users"
  add_foreign_key "head_circumferences", "users"
  add_foreign_key "heights", "users"
  add_foreign_key "meals", "users"
  add_foreign_key "medicines", "users"
  add_foreign_key "milks", "users"
  add_foreign_key "symptoms", "users"
  add_foreign_key "temperatures", "users"
  add_foreign_key "vaccinations", "users"
end
