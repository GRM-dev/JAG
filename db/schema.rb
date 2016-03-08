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

ActiveRecord::Schema.define(version: 20160304123748) do

  create_table "adverts", force: :cascade do |t|
    t.string   "appointment",        limit: 255
    t.string   "url",                limit: 255,                        null: false
    t.date     "date_adv_added"
    t.date     "date_link_added",                                       null: false
    t.date     "date_expiration"
    t.boolean  "verified",                       default: false
    t.date     "date_last_verified",             default: '2016-03-08', null: false
    t.integer  "company_id",         limit: 4
    t.integer  "job_category_id",    limit: 4
    t.integer  "city_id",            limit: 4
    t.integer  "site_id",            limit: 4
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
  end

  create_table "certificates", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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

  create_table "courses", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "educations", force: :cascade do |t|
    t.string   "school_name", limit: 255
    t.string   "field",       limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "experiences", force: :cascade do |t|
    t.integer  "company_id",        limit: 4
    t.integer  "responsibility_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "experiences", ["company_id"], name: "index_experiences_on_company_id", using: :btree
  add_index "experiences", ["responsibility_id"], name: "index_experiences_on_responsibility_id", using: :btree

  create_table "job_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "gender",     limit: 255, default: "undefined"
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "provinces", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "responsibilities", force: :cascade do |t|
    t.string   "resp",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string   "name",       limit: 255, null: false
    t.string   "url",        limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "skills", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.string "name", limit: 255, default: "user", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",           limit: 255,             null: false
    t.string   "password_digest", limit: 255,             null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.integer  "user_role_id",    limit: 4,   default: 1
  end

  add_index "users", ["user_role_id"], name: "index_users_on_user_role_id", using: :btree

  add_foreign_key "experiences", "companies"
  add_foreign_key "experiences", "responsibilities"
  add_foreign_key "users", "user_roles"
end
