class AddEngineDetailsToTechnicalSpecs < ActiveRecord::Migration[8.1]
  def change
    add_column :technical_specs, :torque_nm,          :integer
    add_column :technical_specs, :fuel_tank_liters,   :integer
    add_column :technical_specs, :trunk_liters_folded,:integer
    add_column :technical_specs, :steering_type,      :string
  end
end
