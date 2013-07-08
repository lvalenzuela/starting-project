class CreateSmartphoneTables < ActiveRecord::Migration #migración que genera todas las tablas de Smartphone
  def up
    create_table :smartphones do |t|
      t.string  :img_ref, :default => 'smartphone_images/not_found.png'
      t.string  :modelo
      t.integer :precio
      t.integer :proce_num_cores
      t.integer :proce_speed
      t.string  :proce_modelo
      t.integer :almacenamiento #MB
      t.float   :cam_resolution
      t.float   :cam_front_resolution
      t.boolean :cam_autofoco
      t.integer :dim_alto
      t.integer :dim_ancho
      t.integer :dim_profundidad
      t.integer :dim_peso
      t.integer :battery_capacity
      t.boolean :battery_usb_rechargeable
      t.boolean :battery_wireless_rechargeable
      
      t.belongs_to :marca
      t.belongs_to :sistema_operativo
      t.belongs_to :display_tech
      t.belongs_to :display_depth
      t.belongs_to :display_size
      t.belongs_to :display_resolution
      t.belongs_to :marca_procesador
      t.belongs_to :cam_flash
      
      t.timestamps
    end
  
    create_table :display_techs do |t|
      t.string  :nombre
      t.text    :descripcion
      
      t.timestamps
    end
  
    create_table :display_depths do |t|
      t.string  :profundidad
      
      t.timestamps
    end
  
    create_table :display_sizes do |t|
      t.string  :size
      t.string  :aspect_ratio
      
      t.timestamps
    end
  
    create_table :display_resolutions do |t|
      t.string  :resolution
      #t.string :aspect_ratio
      
      t.timestamps
    end
    
    create_table :marca_procesadors do |t|
      t.string  :nombre_marca
      
      t.timestamps
    end
    
    create_table :marcas do |t|
      t.string  :nombre_marca
      
      t.timestamps
    end
  
    create_table :sistema_operativos do |t|
      t.string  :nombre
      t.string  :version
      
      t.timestamps
    end
    
    create_table :cam_flashs do |t|
      t.string  :tipo
      t.text    :descripcion
      
      t.timestamps
    end
    
    create_table :categorias do |t|
      t.string  :nombre
      
      t.timestamps
    end
    
    create_table :map_marca_categorias, :id => false do |t|
      t.belongs_to :marca
      t.belongs_to :categoria
      
      t.timestamps
    end
  
    create_table :map_smartphone_reds, :id => false do |t|
      t.belongs_to :smartphone
      t.belongs_to :smartphone_red
      
      t.timestamps
    end
    
    create_table :map_smartphone_sensors, :id => false do |t|
      t.belongs_to :smartphone
      t.belongs_to :smartphone_sensor
      
      t.timestamps
    end
  
    create_table :map_smartphone_connectors, :id => false do |t|
      t.belongs_to :smartphone
      t.belongs_to :smartphone_connector
      
      t.timestamps
    end
    
    create_table :smartphone_sensors do |t|
      t.string  :nombre
      t.text    :descripcion
      
      t.timestamps
    end
  
    create_table :smartphone_connectors do |t|
      t.string  :nombre
      t.text    :descripcion
      
      t.timestamps
    end
    
    create_table :map_smartphone_red_protocols, :id => false do |t|
      t.belongs_to :smartphone_red
      t.belongs_to :smartphone_red_protocol
      
      t.timestamps
    end
  
    create_table :smarphone_red_protocols do |t|
      t.string  :nombre
      t.text    :descripcion
      
      t.timestamps
    end
    
    create_table :map_smartphone_red_protocol_supporteds, :id => false do |t|
      t.belongs_to :smartphone_red_protocol
      t.belongs_to :smartphone_red_protocol_supported
      
      t.timestamps
    end
    
    create_table :smartphone_red_protocol_supporteds do |t|
      t.string  :nombre
      t.text    :descripcion
      
      t.timestamps
    end
  end

  def down
    drop_table :smartphones
    drop_table :display_techs
    drop_table :display_depths
    drop_table :display_sizes
    drop_table :display_resolutions
    drop_table :marca_procesadors
    drop_table :marcas
    drop_table :sistema_operativos
    drop_table :cam_flashs
    drop_table :categorias
    drop_table :map_marca_categorias
    drop_table :map_smartphone_reds
    drop_table :map_smartphone_sensors
    drop_table :map_smartphone_connectors
    drop_table :smartphone_sensors
    drop_table :smartphone_connectors
    drop_table :map_smartphone_red_protocols
    drop_table :smartphone_red_protocols
    drop_table :map_smartphone_red_protocol_supporteds
    drop_table :smartphone_red_protocol_supporteds    
  end
end