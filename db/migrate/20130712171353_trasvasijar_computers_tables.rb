class TrasvasijarComputersTables < ActiveRecord::Migration
  def up
  	# Televisores
  	disp_size = DisplaySize.find(:all)

  	disp_size.each do |d|
  		MapDisplaySizeCategoria.create(:display_size_id => d.id, :categoria_id => 2)
  	end

  	# Computadores
  	computers_d_size = ComputersScreenSize.find(:all)

  	computers_d_size.each do |c|
  		if DisplaySize.where(:size => c.size).empty?
  			DisplaySize.create(:size => c.size)
  			MapDisplaySizeCategoria.create(:display_size_id => DisplaySize.find(:last).id, :categoria_id => 3) 
  		else
  			MapDisplaySizeCategoria.create(:display_size_id => DisplaySize.where(:size => c.id).id, :categoria_id => 3)
  		end
  	end
  end

  def down
  end
end
