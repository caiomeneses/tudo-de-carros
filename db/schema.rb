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

ActiveRecord::Schema[8.1].define(version: 2026_05_29_145303) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "brands", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_brands_on_name", unique: true
  end

  create_table "defects", force: :cascade do |t|
    t.string "component"
    t.datetime "created_at", null: false
    t.text "description", null: false
    t.integer "end_year"
    t.string "frequency", null: false
    t.string "source"
    t.integer "start_year"
    t.integer "total_reports", default: 0
    t.datetime "updated_at", null: false
    t.bigint "vehicle_id", null: false
    t.index ["vehicle_id"], name: "index_defects_on_vehicle_id"
    t.check_constraint "frequency::text = ANY (ARRAY['alta'::character varying, 'media'::character varying, 'baixa'::character varying]::text[])", name: "frequency_valid"
  end

  create_table "ev_specs", force: :cascade do |t|
    t.decimal "ac_charging_kw", precision: 5, scale: 1
    t.string "ac_charging_port"
    t.integer "ac_charging_time_0_100_min"
    t.integer "ac_charging_time_30_80_min"
    t.decimal "battery_capacity_kwh", precision: 6, scale: 2
    t.string "battery_type"
    t.datetime "created_at", null: false
    t.decimal "dc_charging_kw", precision: 5, scale: 1
    t.string "dc_charging_port"
    t.integer "dc_charging_time_30_80_min"
    t.string "powertrain_type"
    t.integer "range_km_inmetro"
    t.integer "range_km_total"
    t.integer "range_km_wltp"
    t.string "source"
    t.datetime "updated_at", null: false
    t.bigint "vehicle_id", null: false
    t.date "verified_at"
    t.index ["vehicle_id"], name: "index_ev_specs_on_vehicle_id", unique: true
    t.check_constraint "powertrain_type::text = ANY (ARRAY['BEV'::character varying, 'PHEV'::character varying, 'HEV'::character varying, 'REEV'::character varying]::text[])", name: "powertrain_type_valid"
  end

  create_table "fipe_prices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "fipe_code"
    t.string "fuel_type"
    t.decimal "price", precision: 10, scale: 2, null: false
    t.date "reference_month", null: false
    t.datetime "updated_at", null: false
    t.bigint "vehicle_id", null: false
    t.index ["vehicle_id", "reference_month"], name: "index_fipe_prices_on_vehicle_id_and_reference_month"
    t.index ["vehicle_id"], name: "index_fipe_prices_on_vehicle_id"
  end

  create_table "maintenances", force: :cascade do |t|
    t.decimal "avg_cost", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.string "items", default: [], array: true
    t.integer "km_interval", null: false
    t.string "source"
    t.datetime "updated_at", null: false
    t.bigint "vehicle_id", null: false
    t.date "verified_at"
    t.index ["vehicle_id", "km_interval"], name: "index_maintenances_on_vehicle_id_and_km_interval", unique: true
    t.index ["vehicle_id"], name: "index_maintenances_on_vehicle_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "author"
    t.decimal "comfort", precision: 3, scale: 1
    t.text "comment"
    t.decimal "consumption", precision: 3, scale: 1
    t.datetime "created_at", null: false
    t.decimal "maintenance_cost", precision: 3, scale: 1
    t.decimal "performance", precision: 3, scale: 1
    t.decimal "rating", precision: 3, scale: 1, null: false
    t.string "source"
    t.datetime "updated_at", null: false
    t.bigint "vehicle_id", null: false
    t.index ["vehicle_id"], name: "index_reviews_on_vehicle_id"
    t.check_constraint "rating >= 1::numeric AND rating <= 5::numeric", name: "rating_valid"
  end

  create_table "technical_specs", force: :cascade do |t|
    t.decimal "acceleration_0_100", precision: 4, scale: 1
    t.decimal "approach_angle", precision: 4, scale: 1
    t.decimal "city_consumption_ethanol", precision: 4, scale: 1
    t.decimal "city_consumption_gasoline", precision: 4, scale: 1
    t.datetime "created_at", null: false
    t.integer "curb_weight_kg"
    t.integer "cylinders"
    t.decimal "departure_angle", precision: 4, scale: 1
    t.string "drivetrain"
    t.string "engine"
    t.string "engine_cycle"
    t.integer "engine_displacement_cc"
    t.string "front_brake"
    t.string "front_suspension"
    t.integer "front_track_mm"
    t.integer "fuel_tank_liters"
    t.string "fuel_type"
    t.integer "gross_weight_kg"
    t.integer "ground_clearance_mm"
    t.integer "height_mm"
    t.decimal "highway_consumption_ethanol", precision: 4, scale: 1
    t.decimal "highway_consumption_gasoline", precision: 4, scale: 1
    t.integer "horsepower"
    t.integer "length_mm"
    t.integer "max_towing_kg"
    t.string "rear_brake"
    t.string "rear_suspension"
    t.integer "rear_track_mm"
    t.string "source"
    t.string "steering_type"
    t.string "tire_size"
    t.integer "top_speed_kmh"
    t.decimal "torque_kgfm", precision: 5, scale: 2
    t.integer "torque_nm"
    t.string "transmission"
    t.integer "trunk_liters"
    t.integer "trunk_liters_folded"
    t.datetime "updated_at", null: false
    t.integer "valves"
    t.bigint "vehicle_id", null: false
    t.date "verified_at"
    t.integer "wheelbase_mm"
    t.integer "width_mm"
    t.index ["vehicle_id"], name: "index_technical_specs_on_vehicle_id", unique: true
    t.check_constraint "engine_cycle::text = ANY (ARRAY['Otto'::character varying, 'Atkinson'::character varying, 'Miller'::character varying, 'Diesel'::character varying]::text[])", name: "engine_cycle_valid"
  end

  create_table "vehicles", force: :cascade do |t|
    t.bigint "brand_id", null: false
    t.datetime "created_at", null: false
    t.string "exterior_colors", default: [], array: true
    t.string "interior_colors", default: [], array: true
    t.decimal "launch_price", precision: 10, scale: 2
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.string "version", null: false
    t.integer "year", null: false
    t.index ["brand_id", "name", "version", "year"], name: "index_vehicles_on_brand_id_and_name_and_version_and_year", unique: true
    t.index ["brand_id"], name: "index_vehicles_on_brand_id"
  end

  add_foreign_key "defects", "vehicles"
  add_foreign_key "ev_specs", "vehicles"
  add_foreign_key "fipe_prices", "vehicles"
  add_foreign_key "maintenances", "vehicles"
  add_foreign_key "reviews", "vehicles"
  add_foreign_key "technical_specs", "vehicles"
  add_foreign_key "vehicles", "brands"
end
