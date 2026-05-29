class CreateVehicles < ActiveRecord::Migration[8.1]
  def change
    create_table :vehicles do |t|
      t.references :brand, null: false, foreign_key: true
      t.string  :name,    null: false
      t.string  :version, null: false
      t.integer :year,    null: false

      t.timestamps
    end

    add_index :vehicles, [ :brand_id, :name, :version, :year ], unique: true
  end
end
