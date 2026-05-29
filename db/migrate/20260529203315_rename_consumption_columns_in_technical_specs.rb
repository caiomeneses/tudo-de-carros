class RenameConsumptionColumnsInTechnicalSpecs < ActiveRecord::Migration[8.1]
  def change
    rename_column :technical_specs, :city_consumption_gasoline,    :city_consumption
    rename_column :technical_specs, :highway_consumption_gasoline, :highway_consumption
  end
end
