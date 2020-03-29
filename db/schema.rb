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

ActiveRecord::Schema.define(version: 2020_03_29_175658) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "gender"
    t.integer "age"
    t.string "occupation"
    t.decimal "weight"
    t.decimal "height"
    t.decimal "imc", precision: 10, scale: 2
    t.integer "daily_foods"
    t.boolean "is_completed", default: false
    t.string "disease"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_customers_on_user_id"
  end

  create_table "customers_foods", id: false, force: :cascade do |t|
    t.bigint "food_id", null: false
    t.bigint "customer_id", null: false
    t.index ["food_id", "customer_id"], name: "index_customers_foods_on_food_id_and_customer_id"
  end

  create_table "customers_goals", id: false, force: :cascade do |t|
    t.bigint "goal_id", null: false
    t.bigint "customer_id", null: false
    t.index ["customer_id", "goal_id"], name: "index_customers_goals_on_customer_id_and_goal_id"
  end

  create_table "customers_physical_activities", id: false, force: :cascade do |t|
    t.bigint "physical_activity_id", null: false
    t.bigint "customer_id", null: false
    t.index ["physical_activity_id", "customer_id"], name: "index_customers_excersise_on_excersise_id_and_customer_id"
  end

  create_table "diets", force: :cascade do |t|
    t.integer "price", null: false
    t.integer "status", default: 0
    t.text "recommendations"
    t.datetime "expiration_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "customer_id", null: false
    t.index ["customer_id"], name: "index_diets_on_customer_id"
  end

  create_table "food_categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "foods", force: :cascade do |t|
    t.string "name"
    t.bigint "food_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["food_category_id"], name: "index_foods_on_food_category_id"
  end

  create_table "goals", force: :cascade do |t|
    t.string "goalType"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "physical_activities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "uid"
    t.string "profile_picture"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 0
  end

  add_foreign_key "customers", "users", on_delete: :cascade
  add_foreign_key "diets", "customers", on_delete: :cascade
  add_foreign_key "foods", "food_categories"
end
