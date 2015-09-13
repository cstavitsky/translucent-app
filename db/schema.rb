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

ActiveRecord::Schema.define(version: 20150912192433) do

  create_table "coworkers", force: :cascade do |t|
    t.string  "first_name"
    t.string  "email"
    t.string  "coworker_type"
    t.integer "user_id"
  end

  create_table "emails", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.string  "subject_line_beginning_week"
    t.string  "subject_line_end_week"
    t.string  "addressee_name"
    t.string  "addressee_email"
    t.string  "major_projects"
    t.string  "open_projects"
  end

  create_table "projects", force: :cascade do |t|
    t.string  "name"
    t.string  "status"
    t.string  "priority"
    t.integer "user_id"
    t.boolean "completed", default: false
    t.date    "due_date"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
  end

end
