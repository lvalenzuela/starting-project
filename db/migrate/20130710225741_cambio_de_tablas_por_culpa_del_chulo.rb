class CambioDeTablasPorCulpaDelChulo < ActiveRecord::Migration
  def up
    #crear tabla reds
    create_table :reds do |t|
      t.string  :nombre
      t.text    :descripcion
      
      t.timestamps
    end
    #cambio nombre tablas
    rename_table :smartphone_red_protocol_supporteds, :red_protocol_supporteds
    rename_table :map_smartphone_red_protocol_supporteds, :map_red_protocol_supporteds
    rename_table :smarphone_red_protocols, :red_protocols
    rename_table :map_smartphone_red_protocols, :map_red_protocols
  end

  def down
    drop_table  :reds
    
    rename_table :red_protocol_supporteds, :smartphone_red_protocol_supporteds
    rename_table :map_red_protocol_supporteds, :map_smartphone_red_protocol_supporteds
    rename_table :red_protocols, :smarphone_red_protocols
    rename_table :map_red_protocols, :map_smartphone_red_protocols 
  end
end
