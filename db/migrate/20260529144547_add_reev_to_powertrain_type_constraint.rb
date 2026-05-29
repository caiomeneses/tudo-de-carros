class AddReevToPowertrainTypeConstraint < ActiveRecord::Migration[8.1]
  def change
    remove_check_constraint :ev_specs, name: "powertrain_type_valid"
    add_check_constraint    :ev_specs,
      "powertrain_type IN ('BEV', 'PHEV', 'HEV', 'REEV')",
      name: "powertrain_type_valid"
  end
end
