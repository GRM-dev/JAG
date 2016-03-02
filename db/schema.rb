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

ActiveRecord::Schema.define(version: 20160229142157) do

  create_table "adverts", force: :cascade do |t|
    t.string   "appointment",         limit: 255
    t.string   "url",                 limit: 255
    t.date     "date_adv_added"
    t.date     "date_adv_link_added",             null: false
    t.date     "date_expiration"
    t.boolean  "verified"
    t.date     "date_last_verified"
    t.integer  "company_id",          limit: 4
    t.integer  "job_category_id",     limit: 4
    t.integer  "city_id",             limit: 4
    t.integer  "site_id",             limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name",        limit: 255, null: false
    t.integer  "province_id", limit: 4,   null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "advert_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "job_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "provinces", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "url",        limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255,                  null: false
    t.string   "password_digest", limit: 255,                  null: false
    t.string   "role",            limit: 255, default: "user"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

end
