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

ActiveRecord::Schema[8.0].define(version: 2025_08_05_204323) do
  create_table "artworks", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "publishing_house"
    t.integer "pages"
    t.integer "word_count"
    t.integer "creator_id"
    t.string "product_type"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_books_on_creator_id"
    t.index ["product_type", "product_id"], name: "index_books_on_product"
  end

  create_table "carts", force: :cascade do |t|
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

  create_table "details", force: :cascade do |t|
    t.integer "product_id"
    t.string "description"
    t.decimal "price"
    t.integer "in_stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_details_on_product_id"
  end

  create_table "dn_d_adventures", force: :cascade do |t|
    t.string "title"
    t.string "dnd_version"
    t.integer "creator_id"
    t.string "product_type"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_dn_d_adventures_on_creator_id"
    t.index ["product_type", "product_id"], name: "index_dn_d_adventures_on_product"
  end

  create_table "hand_made_arts", force: :cascade do |t|
    t.string "title"
    t.string "dimensions"
    t.integer "creator_id"
    t.string "product_type"
    t.integer "product_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_hand_made_arts_on_creator_id"
    t.index ["product_type", "product_id"], name: "index_hand_made_arts_on_product"
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
    t.integer "details_id"
    t.integer "product_types_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["details_id"], name: "index_products_on_details_id"
    t.index ["product_types_id"], name: "index_products_on_product_types_id"
    t.index ["promotions_id"], name: "index_products_on_promotions_id"
  end

  create_table "promotions", force: :cascade do |t|
    t.string "promotion_description"
    t.float "discount_percent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "short_stories", force: :cascade do |t|
    t.string "title"
    t.integer "pages"
    t.integer "word_count"
    t.integer "creator_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["creator_id"], name: "index_short_stories_on_creator_id"
  end

  create_table "stores", force: :cascade do |t|
    t.integer "product_id"
    t.integer "cart_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_stores_on_cart_id"
    t.index ["product_id"], name: "index_stores_on_product_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
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
  end
end
