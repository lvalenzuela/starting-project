class TelevisionTableAsdf < ActiveRecord::Migration
  def up
  	create_table :televisions do |t|
  		t.integer :marca_id
  		t.string :img_ref
  		t.string :modelo
  		t.integer :precio
  		t.integer :display_type_id
  		t.integer :display_size_id
  		t.string :image_definition #HD/FULL HD
  		t.integer :angulo_vision_horizontal
  		t.integer :angulo_vision_vertical
  		t.integer :tiempo_respuesta
  		t.integer :has_3d, :limit => 1 # 3D
  		t.integer :convertidor_3d, :limit => 1
  		t.integer :pares_lentes_3d
  		t.integer :smart_tv, :limit => 1
  		t.string :smart_tv_features
  		t.integer :sintonizador_digital, :limit => 1
  		t.integer :reproductor_dvd, :limit => 1
  		t.integer :ethernet_id
  		t.integer :wifi_id
  		t.integer :vga_puerto, :limit => 1
  		t.integer :usb_puertos
  		t.integer :hmdi_puertos
  		t.integer :svideo, :limit => 1
  		t.integer :entrada_compuesta
  		t.integer :dim_alto
  		t.integer :dim_largo
  		t.integer :dim_profundidad
  		t.integer :audio_digital, :limit => 1
  		t.timestamps
  	end
  end

  def down
  	drop_table :televisions
  end
end
