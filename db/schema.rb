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

ActiveRecord::Schema.define(version: 20180611080105) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_variants", force: :cascade do |t|
    t.string "content", null: false
    t.boolean "truthy", default: false, null: false
    t.bigint "test_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_question_id"], name: "index_answer_variants_on_test_question_id"
  end

  create_table "program_tests", force: :cascade do |t|
    t.bigint "program_id"
    t.bigint "test_id"
    t.float "sort_index", default: 1.0, null: false
    t.integer "day_number"
    t.index ["program_id"], name: "index_program_tests_on_program_id"
    t.index ["test_id"], name: "index_program_tests_on_test_id"
  end

  create_table "programs", force: :cascade do |t|
    t.string "name", null: false
    t.integer "days_number"
    t.string "execution"
  end

  create_table "question_types", force: :cascade do |t|
    t.bigint "question_id"
    t.string "answer_type", default: "number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_types_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "text", default: "", null: false
    t.string "theory"
    t.integer "answers_amount", default: 0, null: false
    t.text "right_answer", default: "", null: false
    t.bigint "unit_id", null: false
    t.integer "index"
    t.index ["unit_id"], name: "index_questions_on_unit_id"
  end

  create_table "repetitions", force: :cascade do |t|
    t.bigint "test_id"
    t.integer "number"
    t.string "rule"
    t.integer "period_number"
    t.string "period_rule"
    t.index ["test_id"], name: "index_repetitions_on_test_id"
  end

  create_table "test_questions", force: :cascade do |t|
    t.bigint "test_id"
    t.bigint "question_id"
    t.bigint "widget_id"
    t.bigint "question_type_id"
    t.boolean "in_scenario", default: false, null: false
    t.index ["question_id"], name: "index_test_questions_on_question_id"
    t.index ["question_type_id"], name: "index_test_questions_on_question_type_id"
    t.index ["test_id"], name: "index_test_questions_on_test_id"
    t.index ["widget_id"], name: "index_test_questions_on_widget_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "complexity", default: "", null: false
    t.json "target_audience", default: {}
    t.float "sort_index", default: 1.0, null: false
    t.bigint "unit_id", null: false
    t.index ["unit_id"], name: "index_tests_on_unit_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_topics_on_parent_id"
  end

  create_table "unit_knowledges", force: :cascade do |t|
    t.float "value", default: 0.0, null: false
    t.bigint "user_id"
    t.bigint "unit_id"
    t.index ["unit_id"], name: "index_unit_knowledges_on_unit_id"
    t.index ["user_id"], name: "index_unit_knowledges_on_user_id"
  end

  create_table "units", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_units_on_topic_id"
  end

  create_table "user_answers", force: :cascade do |t|
    t.string "answer", default: "", null: false
    t.boolean "truthy", default: false, null: false
    t.bigint "user_id"
    t.bigint "test_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "test_id"
    t.index ["test_id"], name: "index_user_answers_on_test_id"
    t.index ["test_question_id"], name: "index_user_answers_on_test_question_id"
    t.index ["user_id"], name: "index_user_answers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "full_name"
    t.string "role", default: "user", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "ways", force: :cascade do |t|
    t.bigint "current_test_question_id"
    t.bigint "next_test_question_id"
    t.boolean "right"
    t.bigint "test_id"
    t.index ["current_test_question_id"], name: "index_ways_on_current_test_question_id"
    t.index ["next_test_question_id"], name: "index_ways_on_next_test_question_id"
    t.index ["test_id"], name: "index_ways_on_test_id"
  end

  create_table "widgets", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "description", default: "", null: false
    t.string "question_type", default: "number", null: false
  end

  add_foreign_key "program_tests", "programs"
  add_foreign_key "program_tests", "tests"
  add_foreign_key "user_answers", "tests"
  add_foreign_key "ways", "tests"
end
