# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20161130170629) do

  create_table "order_histories", force: :cascade do |t|
    t.integer  "order_history_id", limit: 4
    t.integer  "order_id",         limit: 4
    t.text     "notify",           limit: 65535
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "order_status_id",  limit: 4
  end

  create_table "order_list_xes", force: :cascade do |t|
    t.integer  "order_number", limit: 4
    t.integer  "uid",          limit: 4
    t.string   "sku",          limit: 255
    t.string   "status",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "order_lists", force: :cascade do |t|
    t.integer  "order_number", limit: 4
    t.integer  "uid",          limit: 4
    t.string   "sku",          limit: 255
    t.integer  "quantity",     limit: 4
    t.string   "status",       limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "order_products", force: :cascade do |t|
    t.integer  "order_product_id", limit: 4
    t.integer  "order_id",         limit: 4
    t.integer  "quantity",         limit: 4
    t.integer  "total_price",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "product_id",       limit: 4
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "order_id",               limit: 4
    t.integer  "payment_transaction_id", limit: 4
    t.decimal  "grand_total",                          precision: 10
    t.integer  "promo_id",               limit: 4
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "parent_order",           limit: 255
    t.text     "billing_address",        limit: 65535
    t.string   "billing_country",        limit: 255
    t.string   "billing_city",           limit: 255
    t.string   "billing_zip_code",       limit: 255
    t.text     "shipping_address",       limit: 65535
    t.string   "shipping_country",       limit: 255
    t.string   "shipping_city",          limit: 255
    t.string   "shipping_zip_code",      limit: 255
    t.string   "ship_to",                limit: 255
    t.integer  "customer_id",            limit: 4
    t.integer  "order_product_id",       limit: 4
    t.integer  "order_history_id",       limit: 4
  end

  create_table "products", force: :cascade do |t|
    t.integer  "product_id",  limit: 4
    t.string   "sku",         limit: 255
    t.string   "name",        limit: 255
    t.text     "description", limit: 65535
    t.decimal  "price",                     precision: 10
    t.integer  "category_id", limit: 4
    t.string   "tags",        limit: 255
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.text     "image_url",   limit: 65535
  end

end
