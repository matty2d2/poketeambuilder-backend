# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_03_122238) do

  create_table "abilities", force: :cascade do |t|
    t.string "name"
    t.string "effect"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "damage_relations", force: :cascade do |t|
    t.string "effectiveness"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "moves", force: :cascade do |t|
    t.string "name"
    t.integer "accuracy"
    t.integer "effect_chance"
    t.integer "pp"
    t.integer "priority"
    t.integer "power"
    t.string "damage_class"
    t.string "ailment"
    t.integer "crit_rate"
    t.integer "drain"
    t.integer "flinch_chance"
    t.integer "healing"
    t.integer "min_hits"
    t.integer "max_hits"
    t.integer "min_turns"
    t.integer "max_turns"
    t.integer "stat_chance"
    t.string "target"
    t.integer "type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["type_id"], name: "index_moves_on_type_id"
  end

  create_table "pokemon_abilities", force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "ability_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ability_id"], name: "index_pokemon_abilities_on_ability_id"
    t.index ["pokemon_id"], name: "index_pokemon_abilities_on_pokemon_id"
  end

  create_table "pokemon_types", force: :cascade do |t|
    t.integer "pokemon_id", null: false
    t.integer "type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_pokemon_types_on_pokemon_id"
    t.index ["type_id"], name: "index_pokemon_types_on_type_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name"
    t.integer "base_speed"
    t.integer "base_special_defence"
    t.integer "base_special_attack"
    t.integer "base_defence"
    t.integer "base_attack"
    t.integer "base_hp"
    t.string "back_sprite"
    t.string "front_sprite"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "generation"
  end

  create_table "status_changes", force: :cascade do |t|
    t.integer "change"
    t.string "stat_name"
    t.integer "move_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["move_id"], name: "index_status_changes_on_move_id"
  end

  create_table "team_pokemons", force: :cascade do |t|
    t.string "name"
    t.integer "speed"
    t.integer "special_def"
    t.integer "special_atk"
    t.integer "defence"
    t.integer "attack"
    t.integer "hp"
    t.integer "team_id", null: false
    t.integer "pokemon_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["pokemon_id"], name: "index_team_pokemons_on_pokemon_id"
    t.index ["team_id"], name: "index_team_pokemons_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "type_modifiers", force: :cascade do |t|
    t.integer "type_id", null: false
    t.integer "target_id", null: false
    t.integer "damage_relation_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["damage_relation_id"], name: "index_type_modifiers_on_damage_relation_id"
    t.index ["target_id"], name: "index_type_modifiers_on_target_id"
    t.index ["type_id"], name: "index_type_modifiers_on_type_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "moves", "types"
  add_foreign_key "pokemon_abilities", "abilities"
  add_foreign_key "pokemon_abilities", "pokemons"
  add_foreign_key "pokemon_types", "pokemons"
  add_foreign_key "pokemon_types", "types"
  add_foreign_key "status_changes", "moves"
  add_foreign_key "team_pokemons", "pokemons"
  add_foreign_key "team_pokemons", "teams"
  add_foreign_key "teams", "users"
  add_foreign_key "type_modifiers", "damage_relations"
  add_foreign_key "type_modifiers", "targets"
  add_foreign_key "type_modifiers", "types"
end
