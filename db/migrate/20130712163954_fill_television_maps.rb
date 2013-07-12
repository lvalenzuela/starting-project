class FillTelevisionMaps < ActiveRecord::Migration
  def up
  	#hasta ahora solo hay elementos correspondientes a televisores
  	display_tech = DisplayTech.find(:all, :conditions => {:descripcion => 'Televisores'})

  	display_tech.each do |d|
  		MapDisplayTechsCategoria.create(:categoria_id => 2, :display_tech_id => d.id)
  	end

  	display_size = DisplaySize.find(:all)
  	display_size.each do |s|
  		MapDisplaySizeCategoria.create(:categoria_id => 2, :display_size_id => s.id)
  	end
  end

  def down
  	MapDisplayTechsCategoria.where(:categoria_id => 2).destroy_all
  	MapDisplaySizeCategoria.where(:categoria_id => 2).destroy_all
  end
end
