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

ActiveRecord::Schema.define(version: 2022_09_10_102232) do

  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_departments_on_user_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.integer "department_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["user_id"], name: "index_employees_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.integer "department_id"
    t.integer "rate"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "slug"
    t.index ["department_id"], name: "index_projects_on_department_id"
    t.index ["slug"], name: "index_projects_on_slug", unique: true
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.integer "employee_id"
    t.integer "project_id"
    t.integer "user_id"
    t.datetime "datetimeperformed"
    t.integer "hours"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "file"
    t.index ["employee_id"], name: "index_works_on_employee_id"
    t.index ["project_id"], name: "index_works_on_project_id"
    t.index ["user_id"], name: "index_works_on_user_id"
  end

  add_foreign_key "departments", "users"
  add_foreign_key "employees", "departments"
  add_foreign_key "employees", "users"
  add_foreign_key "projects", "departments"
  add_foreign_key "projects", "users"
  add_foreign_key "works", "employees"
  add_foreign_key "works", "projects"
  add_foreign_key "works", "users"
end
