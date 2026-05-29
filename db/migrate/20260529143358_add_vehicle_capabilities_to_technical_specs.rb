class AddVehicleCapabilitiesToTechnicalSpecs < ActiveRecord::Migration[8.1]
  def change
    add_column :technical_specs, :cylinders,       :integer
    add_column :technical_specs, :valves,          :integer
    add_column :technical_specs, :approach_angle,  :decimal, precision: 4, scale: 1
    add_column :technical_specs, :departure_angle, :decimal, precision: 4, scale: 1
    add_column :technical_specs, :max_towing_kg,   :integer
  end
end
