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

ActiveRecord::Schema.define(version: 20170419100615) do

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.float "lat"
    t.float "lng"
    t.date "last_order_date"
    t.date "last_visit_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enterprise_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "enterprise_id"
    t.integer "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enterprise_id"], name: "index_enterprise_users_on_enterprise_id"
    t.index ["user_id"], name: "index_enterprise_users_on_user_id"
  end

  create_table "enterprises", force: :cascade do |t|
    t.string "code_enterprise"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.boolean "done"
    t.integer "todo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["todo_id"], name: "index_items_on_todo_id"
  end

  create_table "order_histories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.date "order_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_order_histories_on_client_id"
    t.index ["user_id"], name: "index_order_histories_on_user_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "title"
    t.string "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_clients", force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_user_clients_on_client_id"
    t.index ["user_id"], name: "index_user_clients_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "code_enterprise"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password"
    t.integer "role"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "visit_histories", force: :cascade do |t|
    t.integer "user_id"
    t.integer "client_id"
    t.date "visit_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_visit_histories_on_client_id"
    t.index ["user_id"], name: "index_visit_histories_on_user_id"
  end

end
