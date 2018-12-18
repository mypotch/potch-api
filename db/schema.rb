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

ActiveRecord::Schema.define(version: 2018_12_17_113735) do

  create_table "active_storage_attachments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "admins", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_admins_on_uid_and_provider", unique: true
  end

  create_table "bomber_sources", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.string "url"
    t.integer "method", default: 0
    t.text "headers"
    t.text "params"
    t.text "data"
    t.text "result"
    t.string "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.boolean "enabled", default: true
    t.boolean "recommended", default: false
    t.integer "category", limit: 1, default: 0
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry"
  end

  create_table "categories_posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "post_id"
    t.index ["category_id"], name: "index_categories_posts_on_category_id"
    t.index ["post_id"], name: "index_categories_posts_on_post_id"
  end

  create_table "comments", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "author_type"
    t.bigint "author_id"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.string "content"
    t.string "ip"
    t.boolean "enabled", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_comments_on_author_type_and_author_id"
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["ip"], name: "index_comments_on_ip"
  end

  create_table "counters", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "countable_type"
    t.bigint "countable_id"
    t.integer "comments_count", default: 0
    t.integer "votes_count", default: 0
    t.integer "views_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["countable_type", "countable_id"], name: "index_counters_on_countable_type_and_countable_id"
  end

  create_table "footprints", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "before"
    t.text "after"
    t.string "action"
    t.string "trackable_type"
    t.bigint "trackable_id"
    t.string "actorable_type"
    t.bigint "actorable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["actorable_type", "actorable_id"], name: "index_footprints_on_actorable_type_and_actorable_id"
    t.index ["trackable_type", "trackable_id"], name: "index_footprints_on_trackable_type_and_trackable_id"
  end

  create_table "posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "counter_id"
    t.string "author_type"
    t.bigint "author_id"
    t.string "pid"
    t.string "title"
    t.text "content"
    t.boolean "enabled", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_posts_on_author_type_and_author_id"
    t.index ["counter_id"], name: "index_posts_on_counter_id"
    t.index ["pid"], name: "index_posts_on_pid", unique: true
  end

  create_table "views", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "author_type"
    t.bigint "author_id"
    t.string "viewable_type"
    t.bigint "viewable_id"
    t.string "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_views_on_author_type_and_author_id"
    t.index ["ip"], name: "index_views_on_ip"
    t.index ["viewable_type", "viewable_id"], name: "index_views_on_viewable_type_and_viewable_id"
  end

  create_table "votes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "author_type"
    t.bigint "author_id"
    t.string "voteable_type"
    t.bigint "voteable_id"
    t.string "ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_votes_on_author_type_and_author_id"
    t.index ["ip"], name: "index_votes_on_ip"
    t.index ["voteable_type", "voteable_id"], name: "index_votes_on_voteable_type_and_voteable_id"
  end

  add_foreign_key "posts", "counters"
end
