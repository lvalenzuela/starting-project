class TelevisionTables < ActiveRecord::Migration
  def up
  	nuevas_marcas = ['AOC','Blusens','Haier','Hawk','IRT','Kioto','LG','Master G','Panasonic','RCA','Recco','Samsung','Sony','Toshiba']

  	nuevas_marcas.each do |m|
  		if Marca.where(:nombre_marca => m).empty?
  			Marca.create(:nombre_marca => m)
  			last_id = Marca.find(:last).id
  			MapMarcaCategoria.create(:marca_id => last_id, :categoria_id => 2)
  		end
  	end
  end

  def down
  	nuevas_marcas = ['AOC','Blusens','Haier','Hawk','IRT','Kioto','LG','Master G','Panasonic','RCA','Recco']
  	nuevas_marcas.each do |m|
  		Marca.where(:nombre_marca => m).destroy_all
  	end
  end
end
