class RefactorRangeKmInEvSpecs < ActiveRecord::Migration[8.1]
  def change
    rename_column :ev_specs, :range_km, :range_km_wltp
    add_column    :ev_specs, :range_km_inmetro, :integer
  end
end
