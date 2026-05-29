class AddPowertrainTypeToEvSpecs < ActiveRecord::Migration[8.1]
  def change
    add_column :ev_specs, :powertrain_type, :string
    add_check_constraint :ev_specs,
      "powertrain_type IN ('BEV', 'PHEV', 'HEV')",
      name: "powertrain_type_valid"
  end
end
