class AddMissingDimensionsToTechnicalSpecs < ActiveRecord::Migration[8.1]
  def change
    add_column :technical_specs, :height_mm, :integer
    add_column :technical_specs, :wheelbase_mm, :integer
    add_column :technical_specs, :front_track_mm, :integer
    add_column :technical_specs, :rear_track_mm, :integer
    add_column :technical_specs, :ground_clearance_mm, :integer
    add_column :technical_specs, :curb_weight_kg, :integer
    add_column :technical_specs, :gross_weight_kg, :integer
    add_column :technical_specs, :tire_size, :string
    add_column :technical_specs, :front_suspension, :string
    add_column :technical_specs, :rear_suspension, :string
    add_column :technical_specs, :front_brake, :string
    add_column :technical_specs, :rear_brake, :string
    add_column :technical_specs, :top_speed_kmh, :integer
    add_column :technical_specs, :acceleration_0_100, :decimal, precision: 4, scale: 1
  end
end
