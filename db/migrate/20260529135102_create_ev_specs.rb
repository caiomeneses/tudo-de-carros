class CreateEvSpecs < ActiveRecord::Migration[8.1]
  def change
    create_table :ev_specs do |t|
      t.references :vehicle, null: false, foreign_key: true, index: { unique: true }
      t.string     :battery_type
      t.decimal    :battery_capacity_kwh,     precision: 6, scale: 2
      t.integer    :range_km
      t.decimal    :ac_charging_kw,           precision: 5, scale: 1
      t.string     :ac_charging_port
      t.decimal    :dc_charging_kw,           precision: 5, scale: 1
      t.string     :dc_charging_port
      t.integer    :charging_time_30_80_min
      t.string     :source
      t.date       :verified_at
      t.timestamps
    end
  end
end
