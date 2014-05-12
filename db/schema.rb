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

ActiveRecord::Schema.define(version: 20140509165233) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: true do |t|
    t.integer  "diagnostic_id"
    t.integer  "question_id"
    t.boolean  "option"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "answers", ["diagnostic_id"], name: "index_answers_on_diagnostic_id", using: :btree
  add_index "answers", ["question_id"], name: "index_answers_on_question_id", using: :btree

  create_table "articles", force: true do |t|
    t.string   "title"
    t.string   "image_uid"
    t.text     "content"
    t.text     "content_html"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "articles_topics", force: true do |t|
    t.integer "article_id"
    t.integer "topic_id"
  end

  add_index "articles_topics", ["article_id"], name: "index_articles_topics_on_article_id", using: :btree
  add_index "articles_topics", ["topic_id"], name: "index_articles_topics_on_topic_id", using: :btree

  create_table "authorizations", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authorizations", ["user_id"], name: "index_authorizations_on_user_id", using: :btree

  create_table "diagnostics", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "diagnostics", ["user_id"], name: "index_diagnostics_on_user_id", using: :btree

  create_table "diagnostics_themes", force: true do |t|
    t.integer "diagnostic_id"
    t.integer "theme_id"
  end

  add_index "diagnostics_themes", ["diagnostic_id"], name: "index_diagnostics_themes_on_diagnostic_id", using: :btree
  add_index "diagnostics_themes", ["theme_id"], name: "index_diagnostics_themes_on_theme_id", using: :btree

  create_table "documents", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.string   "file_uid"
    t.string   "file_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents_topics", force: true do |t|
    t.integer "document_id"
    t.integer "topic_id"
  end

  add_index "documents_topics", ["document_id"], name: "index_documents_topics_on_document_id", using: :btree
  add_index "documents_topics", ["topic_id"], name: "index_documents_topics_on_topic_id", using: :btree

  create_table "events", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_uid"
    t.text     "local"
    t.date     "starts_at"
    t.date     "ends_at"
    t.string   "time"
    t.string   "external_link"
    t.float    "value"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "organization_id"
  end

  add_index "events", ["organization_id"], name: "index_events_on_organization_id", using: :btree

  create_table "events_topics", force: true do |t|
    t.integer "event_id"
    t.integer "topic_id"
  end

  add_index "events_topics", ["event_id"], name: "index_events_topics_on_event_id", using: :btree
  add_index "events_topics", ["topic_id"], name: "index_events_topics_on_topic_id", using: :btree

  create_table "organizations", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "kind"
    t.text     "about"
    t.string   "image_uid"
    t.string   "phone"
    t.string   "city"
  end

  add_index "organizations", ["email"], name: "index_organizations_on_email", unique: true, using: :btree
  add_index "organizations", ["reset_password_token"], name: "index_organizations_on_reset_password_token", unique: true, using: :btree

  create_table "questions", force: true do |t|
    t.text     "question_text"
    t.string   "good_answer"
    t.string   "bad_answer"
    t.integer  "topic_id"
    t.integer  "theme_id"
    t.integer  "row_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "related_theme_id"
  end

  add_index "questions", ["theme_id"], name: "index_questions_on_theme_id", using: :btree
  add_index "questions", ["topic_id"], name: "index_questions_on_topic_id", using: :btree

  create_table "services", force: true do |t|
    t.integer  "organization_id"
    t.string   "state"
    t.string   "name"
    t.text     "description"
    t.string   "image_uid"
    t.text     "local"
    t.string   "external_link"
    t.float    "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "services", ["organization_id"], name: "index_services_on_organization_id", using: :btree

  create_table "services_topics", force: true do |t|
    t.integer "service_id"
    t.integer "topic_id"
  end

  add_index "services_topics", ["service_id"], name: "index_services_topics_on_service_id", using: :btree
  add_index "services_topics", ["topic_id"], name: "index_services_topics_on_topic_id", using: :btree

  create_table "settings", force: true do |t|
    t.string   "var",                   null: false
    t.text     "value"
    t.integer  "thing_id"
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "themes", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics_videos", force: true do |t|
    t.integer "video_id"
    t.integer "topic_id"
  end

  add_index "topics_videos", ["topic_id"], name: "index_topics_videos_on_topic_id", using: :btree
  add_index "topics_videos", ["video_id"], name: "index_topics_videos_on_video_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "image_uid"
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
    t.boolean  "active",                 default: true,  null: false
    t.date     "birthdate"
    t.string   "gender"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "url"
    t.string   "embed_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "thumbnail_url"
  end

  create_table "votes", force: true do |t|
    t.boolean  "vote",          default: false, null: false
    t.integer  "voteable_id",                   null: false
    t.string   "voteable_type",                 null: false
    t.integer  "voter_id"
    t.string   "voter_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["voteable_id", "voteable_type"], name: "index_votes_on_voteable_id_and_voteable_type", using: :btree
  add_index "votes", ["voter_id", "voter_type", "voteable_id", "voteable_type"], name: "fk_one_vote_per_user_per_entity", unique: true, using: :btree
  add_index "votes", ["voter_id", "voter_type"], name: "index_votes_on_voter_id_and_voter_type", using: :btree

end
