class FillCategorias < ActiveRecord::Migration
  def up
    Categoria.create(:nombre => 'smartphones')
    Categoria.create(:nombre => 'televisores')
    Categoria.create(:nombre => 'computadores')
    Categoria.create(:nombre => 'autos')
  end

  def down
    Categoria.where(:nombre => 'smartphones').destroy_all
    Categoria.where(:nombre => 'televisores').destroy_all
    Categoria.where(:nombre => 'computadores').destroy_all
    Categoria.where(:nombre => 'autos').destroy_all
  end
end
