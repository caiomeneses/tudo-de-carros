class CreateDefects < ActiveRecord::Migration[8.1]
  def change
    create_table :defects do |t|
      t.references :vehicle, null: false, foreign_key: true
      t.text    :description,   null: false
      t.string  :frequency,     null: false
      t.string  :component
      t.integer :start_year
      t.integer :end_year
      t.string  :source
      t.integer :total_reports, default: 0

      t.timestamps
    end

    add_check_constraint :defects, "frequency IN ('high', 'medium', 'low')", name: "frequency_valid"
  end
end
