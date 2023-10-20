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

ActiveRecord::Schema[7.0].define(version: 2023_10_18_025914) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "text"
    t.jsonb "metadata"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "response_id"
    t.bigint "question_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["response_id"], name: "index_answers_on_response_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "text"
    t.integer "input_type"
    t.jsonb "metadata", default: {}
    t.boolean "required", default: false, null: false
    t.integer "position", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "parent_id"
    t.string "parent_type"
  end

  create_table "responses", force: :cascade do |t|
    t.bigint "version_id", null: false
    t.datetime "submited_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["version_id"], name: "index_responses_on_version_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.integer "position", null: false
    t.bigint "version_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["version_id"], name: "index_sections_on_version_id"
  end

  create_table "versions", force: :cascade do |t|
    t.integer "name"
    t.bigint "form_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_versions_on_form_id"
  end

  add_foreign_key "responses", "versions"
  add_foreign_key "sections", "versions"
  add_foreign_key "versions", "forms"
end
