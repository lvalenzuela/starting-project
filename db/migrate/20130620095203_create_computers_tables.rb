class CreateComputersTables < ActiveRecord::Migration
  def up
    create_table :computers do |t|
      t.string :img_ref, :default => 'computer_images/not_found.png'
      t.integer :marca, :limit => 1
      t.integer :categoria, :limit => 1
      t.string :modelo
      t.integer :sist_operativo, :limit => 1
      t.integer :precio
      t.string :bateria
      t.integer :bateria_duracion
      t.integer :proce_marca
      t.string :proce_version
      t.decimal :proce_velocidad, :precision => 5, :scale => 2
      t.integer :proce_nucleos, :limit => 1
      t.integer :memoria
      t.integer :memoria_tipo, :limit => 1
      t.integer :memoria_velocidad
      t.integer :memoria_max
      t.integer :memoria_ranuras
      t.integer :disco_capacidad
      t.integer :disco_velocidad
      t.integer :disco_ssd, :limit => 1
      t.integer :screen_size, :limit => 1
      t.integer :screen_resol, :limit => 1
      t.integer :screen_type, :limit => 1
      t.integer :lector_blue_ray, :limit => 1
      t.integer :grabador_blue_ray, :limit => 1
      t.integer :lector_dvd, :limit => 1
      t.integer :grabador_dvd, :limit => 1
      t.string :video_modelo
      t.integer :video_memoria
      t.integer :video_tipo_memoria, :limit => 1
      t.integer :webcam, :limit => 1
      t.integer :lector_tarjeta_memoria, :limit => 1
      t.integer :ethernet, :limit => 1
      t.integer :hdmi, :limit => 1
      t.integer :vga, :limit => 1
      t.integer :wifi, :limit => 1
      t.integer :bluetooth, :limit => 1
      t.integer :usb, :limit => 1
      t.integer :largo
      t.integer :ancho
      t.integer :profundidad
      t.timestamps
    end
    
    create_table :computers_marcas do |t|
      t.string :marca
      t.timestamps
    end
    
    create_table :computers_proces do |t|
      t.string :marca
      t.timestamps
    end
    
    create_table :computers_screen_resols do |t|
      t.string :resolucion
      t.timestamps
    end
    
    create_table :computers_screen_sizes do |t|
      t.string :size
      t.timestamps
    end
    
    create_table :computers_screen_types do |t|
      t.string :tipo
      t.timestamps
    end
    
    create_table :computers_sos do |t|
      t.string :sist_operativo
      t.timestamps
    end
    
    create_table :computers_memoria do |t|
      t.string :tipo
      t.timestamps
    end
    
    create_table :computers_categories do |t|
      t.string :category
      t.timestamps
    end
  end

  def down
    drop_table :computers
    drop_table :computers_marcas
    drop_table :computers_proces
    drop_table :computers_screen_resols
    drop_table :computers_screen_sizes
    drop_table :computers_screen_types
    drop_table :computers_sos
    drop_table :computers_categories
  end
end
