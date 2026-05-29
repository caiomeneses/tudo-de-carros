class UpdateDefectFrequenciesToPortuguese < ActiveRecord::Migration[8.1]
  def up
    remove_check_constraint :defects, name: "frequency_valid"

    execute <<~SQL
      UPDATE defects SET frequency = CASE frequency
        WHEN 'high'   THEN 'alta'
        WHEN 'medium' THEN 'media'
        WHEN 'low'    THEN 'baixa'
      END
    SQL

    add_check_constraint :defects, "frequency IN ('alta', 'media', 'baixa')", name: "frequency_valid"
  end

  def down
    remove_check_constraint :defects, name: "frequency_valid"

    execute <<~SQL
      UPDATE defects SET frequency = CASE frequency
        WHEN 'alta'  THEN 'high'
        WHEN 'media' THEN 'medium'
        WHEN 'baixa' THEN 'low'
      END
    SQL

    add_check_constraint :defects, "frequency IN ('high', 'medium', 'low')", name: "frequency_valid"
  end
end
