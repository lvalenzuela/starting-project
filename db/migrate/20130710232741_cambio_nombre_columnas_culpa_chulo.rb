class CambioNombreColumnasCulpaChulo < ActiveRecord::Migration
  def up        
    #cambio de nombre de columnas
    rename_column :map_red_protocol_supporteds, :smartphone_red_protocol_id, :red_protocol_id
    rename_column :map_red_protocol_supporteds, :smartphone_red_protocol_supported_id, :red_protocol_supported_id 
    rename_column :map_red_protocols, :smartphone_red_id, :red_id
    rename_column :map_red_protocols, :red_protocol_id, :red_protocol_id
    rename_column :map_smartphone_reds, :smartphone_red_id , :smartphone_red_id
  end

  def down
    rename_column :map_red_protocol_supporteds, :red_protocol_id, :smartphone_red_protocol_id
    rename_column :map_red_protocol_supporteds, :red_protocol_supported_id, :smartphone_red_protocol_supported_id 
    rename_column :map_red_protocols, :red_id, :smartphone_red_id
    rename_column :map_red_protocols, :red_protocol_id, :red_protocol_id
    rename_column :map_smartphone_reds, :smartphone_red_id, :smartphone_red_id
  end
end
