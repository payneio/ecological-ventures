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

ActiveRecord::Schema[7.0].define(version: 2022_08_01_063439) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "bioregions", id: :string, force: :cascade do |t|
    t.string "title"
    t.string "subrealm_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.index ["subrealm_id"], name: "index_bioregions_on_subrealm_id"
  end

  create_table "bioregions_ecoregions", force: :cascade do |t|
    t.string "bioregion_id", null: false
    t.string "ecoregion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bioregion_id"], name: "index_bioregions_ecoregions_on_bioregion_id"
    t.index ["ecoregion_id"], name: "index_bioregions_ecoregions_on_ecoregion_id"
  end

  create_table "bioregions_problems", id: false, force: :cascade do |t|
    t.string "bioregion_id"
    t.bigint "problem_id"
    t.index ["bioregion_id", "problem_id"], name: "index_bioregions_problems_on_bioregion_id_and_problem_id", unique: true
    t.index ["bioregion_id"], name: "index_bioregions_problems_on_bioregion_id"
    t.index ["problem_id"], name: "index_bioregions_problems_on_problem_id"
  end

  create_table "bioregions_taxa", id: false, force: :cascade do |t|
    t.string "bioregion_id"
    t.bigint "taxon_id"
    t.index ["bioregion_id", "taxon_id"], name: "index_bioregions_taxa_on_bioregion_id_and_taxon_id", unique: true
    t.index ["bioregion_id"], name: "index_bioregions_taxa_on_bioregion_id"
    t.index ["taxon_id"], name: "index_bioregions_taxa_on_taxon_id"
  end

  create_table "bioregions_ventures", id: false, force: :cascade do |t|
    t.string "bioregion_id"
    t.bigint "venture_id"
    t.index ["bioregion_id", "venture_id"], name: "index_bioregions_ventures_on_bioregion_id_and_venture_id", unique: true
    t.index ["bioregion_id"], name: "index_bioregions_ventures_on_bioregion_id"
    t.index ["venture_id"], name: "index_bioregions_ventures_on_venture_id"
  end

  create_table "ecoregions", id: :string, force: :cascade do |t|
    t.string "key", null: false
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_ecoregions_on_key"
  end

  create_table "ecoregions_problems", id: false, force: :cascade do |t|
    t.string "ecoregion_id"
    t.bigint "problem_id"
    t.index ["ecoregion_id", "problem_id"], name: "index_ecoregions_problems_on_ecoregion_id_and_problem_id", unique: true
    t.index ["ecoregion_id"], name: "index_ecoregions_problems_on_ecoregion_id"
    t.index ["problem_id"], name: "index_ecoregions_problems_on_problem_id"
  end

  create_table "ecoregions_taxa", id: false, force: :cascade do |t|
    t.string "ecoregion_id"
    t.bigint "taxon_id"
    t.index ["ecoregion_id", "taxon_id"], name: "index_ecoregions_taxa_on_ecoregion_id_and_taxon_id", unique: true
    t.index ["ecoregion_id"], name: "index_ecoregions_taxa_on_ecoregion_id"
    t.index ["taxon_id"], name: "index_ecoregions_taxa_on_taxon_id"
  end

  create_table "ecoregions_ventures", id: false, force: :cascade do |t|
    t.string "ecoregion_id"
    t.bigint "venture_id"
    t.index ["ecoregion_id", "venture_id"], name: "index_ecoregions_ventures_on_ecoregion_id_and_venture_id", unique: true
    t.index ["ecoregion_id"], name: "index_ecoregions_ventures_on_ecoregion_id"
    t.index ["venture_id"], name: "index_ecoregions_ventures_on_venture_id"
  end

  create_table "ecosystems", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "link"
    t.string "cover_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "email"
    t.string "linkedin"
    t.string "facebook"
    t.string "website"
    t.string "address"
    t.string "country"
    t.string "portrait"
    t.string "avatar"
    t.text "description"
    t.text "interests"
    t.boolean "is_public"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people_ventures", id: false, force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "venture_id", null: false
    t.index ["person_id", "venture_id"], name: "index_people_ventures_on_person_id_and_venture_id", unique: true
    t.index ["person_id"], name: "index_people_ventures_on_person_id"
    t.index ["venture_id"], name: "index_people_ventures_on_venture_id"
  end

  create_table "problems", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "problems_realms", id: false, force: :cascade do |t|
    t.bigint "problem_id"
    t.string "realm_id"
    t.index ["problem_id", "realm_id"], name: "index_problems_realms_on_problem_id_and_realm_id", unique: true
    t.index ["problem_id"], name: "index_problems_realms_on_problem_id"
    t.index ["realm_id"], name: "index_problems_realms_on_realm_id"
  end

  create_table "problems_solutions", id: false, force: :cascade do |t|
    t.bigint "problem_id"
    t.bigint "solution_id"
    t.index ["problem_id", "solution_id"], name: "index_problems_solutions_on_problem_id_and_solution_id", unique: true
    t.index ["problem_id"], name: "index_problems_solutions_on_problem_id"
    t.index ["solution_id"], name: "index_problems_solutions_on_solution_id"
  end

  create_table "problems_subrealms", id: false, force: :cascade do |t|
    t.bigint "problem_id"
    t.string "subrealm_id"
    t.index ["problem_id", "subrealm_id"], name: "index_problems_subrealms_on_problem_id_and_subrealm_id", unique: true
    t.index ["problem_id"], name: "index_problems_subrealms_on_problem_id"
    t.index ["subrealm_id"], name: "index_problems_subrealms_on_subrealm_id"
  end

  create_table "problems_ventures", id: false, force: :cascade do |t|
    t.bigint "problem_id"
    t.bigint "venture_id"
    t.index ["problem_id", "venture_id"], name: "index_problems_ventures_on_problem_id_and_venture_id", unique: true
    t.index ["problem_id"], name: "index_problems_ventures_on_problem_id"
    t.index ["venture_id"], name: "index_problems_ventures_on_venture_id"
  end

  create_table "realms", id: :string, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "realms_taxa", id: false, force: :cascade do |t|
    t.string "realm_id"
    t.bigint "taxon_id"
    t.index ["realm_id", "taxon_id"], name: "index_realms_taxa_on_realm_id_and_taxon_id", unique: true
    t.index ["realm_id"], name: "index_realms_taxa_on_realm_id"
    t.index ["taxon_id"], name: "index_realms_taxa_on_taxon_id"
  end

  create_table "realms_ventures", id: false, force: :cascade do |t|
    t.string "realm_id"
    t.bigint "venture_id"
    t.index ["realm_id", "venture_id"], name: "index_realms_ventures_on_realm_id_and_venture_id", unique: true
    t.index ["realm_id"], name: "index_realms_ventures_on_realm_id"
    t.index ["venture_id"], name: "index_realms_ventures_on_venture_id"
  end

  create_table "revisions", force: :cascade do |t|
    t.string "revisable_type", null: false
    t.bigint "revisable_id", null: false
    t.bigint "user_id", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["revisable_type", "revisable_id"], name: "index_revisions_on_revisable"
  end

  create_table "roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "role", null: false
    t.string "roleable_type", null: false
    t.bigint "roleable_id", null: false
    t.bigint "set_by", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["roleable_type", "roleable_id", "role"], name: "index_roles_on_roleable_type_and_roleable_id_and_role"
    t.index ["roleable_type", "roleable_id"], name: "index_roles_on_roleable"
    t.index ["user_id"], name: "index_roles_on_user_id"
  end

  create_table "solutions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "link"
    t.string "cover_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "solutions_ventures", id: false, force: :cascade do |t|
    t.bigint "solution_id"
    t.bigint "venture_id"
    t.index ["solution_id", "venture_id"], name: "index_solutions_ventures_on_solution_id_and_venture_id", unique: true
    t.index ["solution_id"], name: "index_solutions_ventures_on_solution_id"
    t.index ["venture_id"], name: "index_solutions_ventures_on_venture_id"
  end

  create_table "subrealms", id: :string, force: :cascade do |t|
    t.string "title"
    t.string "realm_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["realm_id"], name: "index_subrealms_on_realm_id"
  end

  create_table "subrealms_taxa", id: false, force: :cascade do |t|
    t.string "subrealm_id"
    t.bigint "taxon_id"
    t.index ["subrealm_id", "taxon_id"], name: "index_subrealms_taxa_on_subrealm_id_and_taxon_id", unique: true
    t.index ["subrealm_id"], name: "index_subrealms_taxa_on_subrealm_id"
    t.index ["taxon_id"], name: "index_subrealms_taxa_on_taxon_id"
  end

  create_table "subrealms_ventures", id: false, force: :cascade do |t|
    t.string "subrealm_id"
    t.bigint "venture_id"
    t.index ["subrealm_id", "venture_id"], name: "index_subrealms_ventures_on_subrealm_id_and_venture_id", unique: true
    t.index ["subrealm_id"], name: "index_subrealms_ventures_on_subrealm_id"
    t.index ["venture_id"], name: "index_subrealms_ventures_on_venture_id"
  end

  create_table "taxa", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "link"
    t.string "cover_photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxa_ventures", id: false, force: :cascade do |t|
    t.bigint "taxon_id"
    t.bigint "venture_id"
    t.index ["taxon_id", "venture_id"], name: "index_taxa_ventures_on_taxon_id_and_venture_id", unique: true
    t.index ["taxon_id"], name: "index_taxa_ventures_on_taxon_id"
    t.index ["venture_id"], name: "index_taxa_ventures_on_venture_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
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
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false
    t.string "time_zone", default: "UTC"
    t.string "username", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  create_table "ventures", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "logo"
    t.integer "org_size"
    t.integer "year_started"
    t.string "status"
    t.string "labels"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "cover_photo"
    t.string "summary"
    t.string "link"
    t.string "discord"
    t.string "youtube"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bioregions", "subrealms"
  add_foreign_key "bioregions_ecoregions", "bioregions"
  add_foreign_key "bioregions_ecoregions", "ecoregions"
  add_foreign_key "bioregions_problems", "bioregions"
  add_foreign_key "bioregions_problems", "problems"
  add_foreign_key "bioregions_taxa", "bioregions"
  add_foreign_key "bioregions_taxa", "taxa"
  add_foreign_key "bioregions_ventures", "bioregions"
  add_foreign_key "bioregions_ventures", "ventures"
  add_foreign_key "ecoregions_problems", "ecoregions"
  add_foreign_key "ecoregions_problems", "problems"
  add_foreign_key "ecoregions_taxa", "ecoregions"
  add_foreign_key "ecoregions_taxa", "taxa"
  add_foreign_key "ecoregions_ventures", "ecoregions"
  add_foreign_key "ecoregions_ventures", "ventures"
  add_foreign_key "problems_realms", "problems"
  add_foreign_key "problems_realms", "realms"
  add_foreign_key "problems_solutions", "problems"
  add_foreign_key "problems_solutions", "solutions"
  add_foreign_key "problems_subrealms", "problems"
  add_foreign_key "problems_subrealms", "subrealms"
  add_foreign_key "problems_ventures", "problems"
  add_foreign_key "problems_ventures", "ventures"
  add_foreign_key "realms_taxa", "realms"
  add_foreign_key "realms_taxa", "taxa"
  add_foreign_key "realms_ventures", "realms"
  add_foreign_key "realms_ventures", "ventures"
  add_foreign_key "solutions_ventures", "solutions"
  add_foreign_key "solutions_ventures", "ventures"
  add_foreign_key "subrealms", "realms"
  add_foreign_key "subrealms_taxa", "subrealms"
  add_foreign_key "subrealms_taxa", "taxa"
  add_foreign_key "subrealms_ventures", "subrealms"
  add_foreign_key "subrealms_ventures", "ventures"
  add_foreign_key "taxa_ventures", "taxa"
  add_foreign_key "taxa_ventures", "ventures"
end
