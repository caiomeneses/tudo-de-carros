class RefactorConsumptionColumnsInTechnicalSpecs < ActiveRecord::Migration[8.1]
  def change
    rename_column :technical_specs, :city_consumption,    :city_consumption_gasoline
    rename_column :technical_specs, :highway_consumption, :highway_consumption_gasoline
    add_column    :technical_specs, :city_consumption_ethanol,    :decimal, precision: 4, scale: 1
    add_column    :technical_specs, :highway_consumption_ethanol, :decimal, precision: 4, scale: 1
  end
end
