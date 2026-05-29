class CreateReviews < ActiveRecord::Migration[8.1]
  def change
    create_table :reviews do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.decimal :rating,           null: false, precision: 3, scale: 1
      t.text    :comment
      t.decimal :comfort,          precision: 3, scale: 1
      t.decimal :performance,      precision: 3, scale: 1
      t.decimal :consumption,      precision: 3, scale: 1
      t.decimal :maintenance_cost, precision: 3, scale: 1
      t.string  :source
      t.string  :author

      t.timestamps
    end

    add_check_constraint :reviews, "rating BETWEEN 1 AND 5", name: "rating_valid"
  end
end
