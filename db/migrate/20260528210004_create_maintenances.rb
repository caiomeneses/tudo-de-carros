class CreateMaintenances < ActiveRecord::Migration[8.1]
  def change
    create_table :maintenances do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.integer :km_interval, null: false
      t.string  :items, array: true, default: []
      t.decimal :avg_cost, precision: 8, scale: 2
      t.string  :source
      t.date    :verified_at

      t.timestamps
    end

    add_index :maintenances, [ :vehicle_id, :km_interval ], unique: true
  end
end
