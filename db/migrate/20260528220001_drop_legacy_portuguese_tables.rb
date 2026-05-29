class DropLegacyPortugueseTables < ActiveRecord::Migration[8.1]
  def up
    drop_table :avaliacoes,    if_exists: true
    drop_table :defeitos,      if_exists: true
    drop_table :ficha_tecnicas, if_exists: true
    drop_table :precos_fipe,   if_exists: true
    drop_table :revisoes,      if_exists: true
    drop_table :veiculos,      if_exists: true
    drop_table :marcas,        if_exists: true
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
