class AddAcChargingTimeToEvSpecs < ActiveRecord::Migration[8.1]
  def change
    add_column :ev_specs, :ac_charging_time_0_100_min, :integer
  end
end
