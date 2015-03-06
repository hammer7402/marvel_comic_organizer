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

ActiveRecord::Schema.define(version: 20150305153514) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bins", force: :cascade do |t|
    t.string  "bin",     default: "N/A"
    t.integer "user_id"
  end

  create_table "bins_comics", force: :cascade do |t|
    t.integer "bin_id"
    t.integer "comic_id"
  end

  add_index "bins_comics", ["bin_id"], name: "index_bins_comics_on_bin_id", using: :btree
  add_index "bins_comics", ["comic_id"], name: "index_bins_comics_on_comic_id", using: :btree

  create_table "comics", force: :cascade do |t|
    t.integer "marvel_id",    null: false
    t.string  "title",        null: false
    t.integer "issueNumber"
    t.string  "description"
    t.string  "isbn"
    t.string  "upc"
    t.string  "diamondCode"
    t.string  "ean"
    t.string  "issn"
    t.string  "format"
    t.integer "pageCount"
    t.string  "purchase_url"
    t.string  "image_url"
    t.string  "creators"
  end

  create_table "users", force: :cascade do |t|
    t.string "username",        null: false
    t.string "email",           null: false
    t.string "password_digest", null: false
  end

end
