class TelevisionMaps < ActiveRecord::Migration
  def up
  	#mapear display_tech con categorias

  	create_table :map_display_techs_categoria do |t|
  		t.belongs_to :categoria
  		t.belongs_to :display_tech
  		t.timestamps
  	end

  	#mapear display_sizes con categorias
  	create_table :map_display_size_categoria do |t|
  		t.belongs_to :display_size
  		t.belongs_to :categoria
  		t.timestamps
  	end
  end

  def down
  	drop_table :map_display_techs_categoria
  	drop_table :map_display_size_categoria
  end
end
