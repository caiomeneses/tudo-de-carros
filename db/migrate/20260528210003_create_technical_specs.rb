class CreateTechnicalSpecs < ActiveRecord::Migration[8.1]
  def change
    create_table :technical_specs do |t|
      t.references :vehicle, null: false, foreign_key: true, index: { unique: true }
      t.string  :engine
      t.integer :horsepower
      t.decimal :torque_kgfm,        precision: 5, scale: 2
      t.string  :fuel_type
      t.string  :transmission
      t.string  :drivetrain
      t.decimal :city_consumption,   precision: 4, scale: 1
      t.decimal :highway_consumption, precision: 4, scale: 1
      t.integer :length_mm
      t.integer :width_mm
      t.integer :trunk_liters
      t.string  :source
      t.date    :verified_at

      t.timestamps
    end
  end
end
