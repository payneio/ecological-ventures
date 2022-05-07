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

ActiveRecord::Schema[7.0].define(version: 2022_05_05_041342) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ecosystems", id: :bigint, default: nil, force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.text "link"
    t.text "cover_photo"
    t.text "created_at", null: false
    t.text "updated_at", null: false
  end

  create_table "people", id: :bigint, default: nil, force: :cascade do |t|
    t.text "name"
    t.text "phone"
    t.text "email"
    t.text "linkedin"
    t.text "facebook"
    t.text "website"
    t.text "address"
    t.text "country"
    t.text "portrait"
    t.text "avatar"
    t.text "bio"
    t.text "interests"
    t.boolean "is_public"
    t.text "created_at", null: false
    t.text "updated_at", null: false
  end

  create_table "people_ventures", id: false, force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "venture_id", null: false
    t.index ["person_id"], name: "index_people_ventures_on_person_id"
    t.index ["venture_id"], name: "index_people_ventures_on_venture_id"
  end

  create_table "problems", id: :bigint, default: nil, force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.text "created_at", null: false
    t.text "updated_at", null: false
  end

  create_table "solutions", id: :bigint, default: nil, force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.text "link"
    t.text "cover_photo"
    t.text "created_at", null: false
    t.text "updated_at", null: false
  end

  create_table "taxa", id: :bigint, default: nil, force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.text "link"
    t.text "cover_photo"
    t.text "created_at", null: false
    t.text "updated_at", null: false
  end

  create_table "ventures", id: :bigint, default: nil, force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.text "logo"
    t.bigint "org_size"
    t.bigint "year_started"
    t.text "status"
    t.text "labels"
    t.text "created_at", null: false
    t.text "updated_at", null: false
    t.text "cover_photo"
    t.text "summary"
    t.text "link"
    t.text "discord"
    t.text "youtube"
  end

end
