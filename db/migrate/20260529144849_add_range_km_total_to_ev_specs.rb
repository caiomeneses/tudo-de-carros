class AddRangeKmTotalToEvSpecs < ActiveRecord::Migration[8.1]
  def change
    add_column :ev_specs, :range_km_total, :integer
  end
end
