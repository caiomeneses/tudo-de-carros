class ConvertPriceToDecimalAndAddLaunchPrice < ActiveRecord::Migration[8.1]
  def up
    change_column :fipe_prices, :price, :decimal, precision: 10, scale: 2
    add_column    :vehicles,    :launch_price, :decimal, precision: 10, scale: 2
  end

  def down
    change_column :fipe_prices, :price, :integer
    remove_column :vehicles,    :launch_price
  end
end
