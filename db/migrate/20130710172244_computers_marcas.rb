class ComputersMarcas < ActiveRecord::Migration
  def up
  	execute "TRUNCATE marcas"
  	execute "TRUNCATE map_marca_categoria"
  	computers_marcas = ComputersMarca.find(:all)

  	computers_marcas.each do |m|
  		Marca.create(:nombre_marca => m.marca )
  		MapMarcaCategoria.create(:marca_id => Marca.find(:last).id, :categoria_id => 3 )
  	end

  end

  def down
  	#deja vacía la tabla
  	Marca.destroy_all	
  end
end
