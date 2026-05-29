class CreateFipePrices < ActiveRecord::Migration[8.1]
  def change
    create_table :fipe_prices do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.decimal :price,           null: false, precision: 10, scale: 2
      t.date    :reference_month, null: false
      t.string  :fipe_code
      t.string  :fuel_type

      t.timestamps
    end

    add_index :fipe_prices, [ :vehicle_id, :reference_month ]
  end
end
