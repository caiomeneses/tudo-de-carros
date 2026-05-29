class AddEngineDisplacementAndCycleToTechnicalSpecs < ActiveRecord::Migration[8.1]
  def change
    add_column :technical_specs, :engine_displacement_cc, :integer
    add_column :technical_specs, :engine_cycle,           :string
    add_check_constraint :technical_specs,
      "engine_cycle IN ('Otto', 'Atkinson', 'Miller', 'Diesel')",
      name: "engine_cycle_valid"
  end
end
