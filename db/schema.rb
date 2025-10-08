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

ActiveRecord::Schema[8.0].define(version: 2025_08_07_170221) do
  create_table "cart_items", force: :cascade do |t|
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "creators", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_details", force: :cascade do |t|
    t.integer "product_id"
    t.string "description"
    t.decimal "price"
    t.integer "in_stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_details_on_product_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "type"
    t.string "medium"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "artstyle"
  end

  create_table "products", force: :cascade do |t|
    t.integer "promotions_id"
    t.integer "product_details_id"
    t.integer "product_types_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["product_details_id"], name: "index_products_on_product_details_id"
    t.index ["product_types_id"], name: "index_products_on_product_types_id"
    t.index ["promotions_id"], name: "index_products_on_promotions_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "promotion_description"
    t.float "discount_percent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.integer "cart_item_id"
    t.string "email"
    t.string "first_name"
    t.string "string"
    t.string "last_name"
    t.string "address"
    t.string "zipcode"
    t.string "state"
    t.string "sex"
    t.string "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_item_id"], name: "index_users_on_cart_item_id"
  end
end
