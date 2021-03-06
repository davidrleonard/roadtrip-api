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

ActiveRecord::Schema.define(version: 20150410092937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "key"
    t.string "headline"
    t.string "author_name"
    t.string "author_title"
    t.string "source_url"
    t.string "article_narratives_json"
  end

  create_table "layers", force: :cascade do |t|
    t.integer "narrative_id"
    t.integer "rank"
    t.string  "content"
    t.string  "source_url"
    t.string  "photo_url"
    t.string  "image_path"
    t.string  "category"
    t.string  "question"
    t.string  "answer"
    t.float   "lon"
    t.float   "lat"
    t.integer "zoom_level"
    t.string  "description_text"
    t.string  "callout_number"
    t.string  "quote_text"
    t.string  "quote_attribution"
  end

  add_index "layers", ["narrative_id"], name: "index_layers_on_narrative_id", using: :btree

  create_table "narratives", force: :cascade do |t|
    t.integer "article_id"
    t.string  "narrative_thread"
    t.string  "photo_url"
    t.string  "photog_name"
    t.string  "caption_content"
    t.string  "source_url"
    t.string  "photog_org"
  end

  add_index "narratives", ["article_id"], name: "index_narratives_on_article_id", using: :btree

end
