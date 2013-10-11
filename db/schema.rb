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

ActiveRecord::Schema.define(version: 20130911022525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "categories", id: :uuid, force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "category_friendships", id: :uuid, force: true do |t|
    t.uuid     "category_id"
    t.uuid     "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_friendships", ["category_id", "friend_id"], name: "index_category_friendships_on_category_id_and_friend_id", unique: true, using: :btree
  add_index "category_friendships", ["category_id"], name: "index_category_friendships_on_category_id", using: :btree
  add_index "category_friendships", ["friend_id"], name: "index_category_friendships_on_friend_id", using: :btree

  create_table "category_relations", id: :uuid, force: true do |t|
    t.uuid     "parent_id"
    t.uuid     "child_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "category_relations", ["child_id"], name: "index_category_relations_on_child_id", using: :btree
  add_index "category_relations", ["parent_id", "child_id"], name: "index_category_relations_on_parent_id_and_child_id", unique: true, using: :btree
  add_index "category_relations", ["parent_id"], name: "index_category_relations_on_parent_id", using: :btree

  create_table "classifications", id: :uuid, force: true do |t|
    t.uuid     "category_id"
    t.uuid     "quiz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "classifications", ["category_id", "quiz_id"], name: "index_classifications_on_category_id_and_quiz_id", unique: true, using: :btree
  add_index "classifications", ["category_id"], name: "index_classifications_on_category_id", using: :btree
  add_index "classifications", ["quiz_id"], name: "index_classifications_on_quiz_id", using: :btree

  create_table "quizes", id: :uuid, force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dependencies", force: true do |t|
    t.uuid     "postreq_id"
    t.uuid     "prereq_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dependencies", ["postreq_id"], name: "index_dependencies_on_postreq_id", using: :btree
  add_index "dependencies", ["prereq_id", "postreq_id"], name: "index_dependencies_on_prereq_id_and_postreq_id", unique: true, using: :btree
  add_index "dependencies", ["prereq_id"], name: "index_dependencies_on_prereq_id", using: :btree

  create_table "questions", id: :uuid, force: true do |t|
    t.uuid     "quiz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "creator_id"
    t.string   "question"
    t.string   "answer"
  end

  add_index "questions", ["creator_id"], name: "index_questions_on_creator_id", using: :btree

  create_table "lesson_interactions", id: :uuid, force: true do |t|
    t.uuid     "lesson_id"
    t.uuid     "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lessons", force: true do |t|
    t.string   "name"
    t.uuid     "quiz_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.uuid     "creator_id"
    t.string   "link"
  end

  add_index "lessons", ["creator_id"], name: "index_lessons_on_creator_id", using: :btree

  create_table "users", id: :uuid, force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "username"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
