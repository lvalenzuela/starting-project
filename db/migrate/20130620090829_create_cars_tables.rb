class CreateCarsTables < ActiveRecord::Migration
  def up
    #migración que genera todas las tablas autos
    create_table :cars do |t|
      t.string :image_reference, :default => 'car_images/not_found.png'
      t.integer :marca
      t.string :model
      t.string :version
      t.integer :precio
      t.string :garantia
      t.integer :body_style , :limit => 1
      t.integer :cap_pasajeros, :limit => 1
      t.integer :motor
      t.integer :traccion, :limit => 1
      t.integer :transmision, :limit => 1
      t.integer :combustible, :limit => 1
      t.integer :consumo_ciudad
      t.integer :consumo_carretera
      t.integer :dist_estanque_ciudad
      t.integer :dist_estanque_carretera
      t.integer :potencia
      t.integer :torque
      t.integer :cap_remolque
      t.integer :velocidad_max
      t.integer :cap_carga_kg
      t.integer :cap_carga_m3
      t.integer :de_0_a_100
      t.integer :cant_parlantes
      #BOOLEANOS
      t.integer :bluetooth, :limit => 1
      t.integer :aux, :limit => 1
      t.integer :usb, :limit => 1
      t.integer :llantas_aleacion, :limit => 1
      t.integer :llantas_aluminio, :limit => 1
      t.integer :sunroof, :limit => 1
      t.integer :neblineros_front, :limit => 1
      t.integer :neblineros_back, :limit => 1
      t.integer :alzavidrios_electricos, :limit => 1
      t.integer :ac, :limit => 1
      t.integer :climatizador, :limit => 1
      t.integer :smart_key, :limit => 1
      t.integer :ctrl_radio_volante, :limit => 1
      t.integer :asientos_calefaccion, :limit => 1
      t.integer :asientos_cuero, :limit => 1
      t.integer :asientos_electricos, :limit => 1
      t.integer :gps, :limit => 1
      t.integer :dvd, :limit => 1
      t.integer :sensor_retroceso, :limit => 1
      t.integer :camara_retroceso, :limit => 1
      t.integer :velocidad_crucero, :limit => 1
      t.integer :espejos_electricos, :limit => 1
      t.integer :abs, :limit => 1
      t.integer :anclaje_infantil, :limit => 1
      t.integer :encendido_auto_luz, :limit => 1
      t.integer :airbags, :limit => 1 
      t.integer :sensor_lluvia, :limit => 1
      t.integer :seguro_infantil, :limit => 1
      t.integer :control_estabilidad, :limit => 1
      t.integer :monitor_presion, :limit => 1
      t.integer :control_traccion, :limit => 1
      t.integer :largo
      t.integer :ancho
      t.integer :alto
      t.integer :peso
      t.integer :volumen_interior
      t.integer :cap_maleta
      t.integer :cap_estanque
      t.integer :largo_pickup
      t.integer :ancho_pickup
      t.integer :alto_pickup
      t.timestamps
    end
    
    create_table :cars_body_styles do |t|
      t.string :body_style
      t.timestamps
    end
    
    create_table :cars_combustibles do |t|
      t.string :combustible
      t.timestamps
    end
    
    create_table :cars_traccions do |t|
      t.string :traccion
      t.timestamps
    end
    
    create_table :cars_transmisions do |t|
      t.string :transmision
      t.timestamps
    end
    
    create_table :cars_marcas do |t|
      t.string :marca
      t.timestamps
    end
    
  end

  def down
    drop_table :cars
    drop_table :cars_combustibles
    drop_table :cars_traccions
    drop_table :cars_transmisions
    drop_table :cars_marcas
    drop_table :cars_body_styles
  end
end
