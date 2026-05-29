class AddColorsToVehicles < ActiveRecord::Migration[8.1]
  def change
    add_column :vehicles, :exterior_colors, :string, array: true, default: []
    add_column :vehicles, :interior_colors, :string, array: true, default: []
  end
end
