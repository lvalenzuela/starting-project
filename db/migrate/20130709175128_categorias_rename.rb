class CategoriasRename < ActiveRecord::Migration
  def up
    rename_table :categorias, :categoria
  end

  def down
    rename_table :categoria, :categorias
  end
end
