class RefactorChargingTimeColumnsInEvSpecs < ActiveRecord::Migration[8.1]
  def change
    rename_column :ev_specs, :charging_time_30_80_min, :dc_charging_time_30_80_min
    add_column    :ev_specs, :ac_charging_time_30_80_min, :integer
  end
end
