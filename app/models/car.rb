class Car < ActiveRecord::Base
  attr_accessible :id
  attr_accessible :marca, :model, :version, :image_reference
  attr_accessible :cant_parlantes, :bluetooth, :aux, :usb
  attr_accessible :llantas_aleacion, :llantas_aluminio, :sunroof, :neblineros_front, :neblineros_back
  attr_accessible :precio, :garantia, :body_style, :cap_pasajeros, :motor
  attr_accessible :traccion, :transmision, :combustible
  attr_accessible :alzavidrios_electricos, :ac, :climatizador, :smart_key, :ctrl_radio_volante, :asientos_calefaccion, :asientos_cuero
  attr_accessible :gps, :dvd, :sensor_retroceso, :camara_retroceso, :velocidad_crucero, :espejos_electricos
  attr_accessible :consumo_ciudad, :consumo_carretera, :dist_estanque_ciudad, :dist_estanque_carretera, :potencia
  attr_accessible :torque, :cap_remolque, :velocidad_max, :cap_carga_kg, :cap_carga_m3, :de_0_a_100
  attr_accessible :abs, :anclaje_infantil, :encendido_auto_luz, :airbags, :sensor_lluvia, :seguro_infantil, :monitor_presion
  attr_accessible :control_traccion, :asientos_electricos, :control_estabilidad
  attr_accessible :largo, :ancho, :alto, :peso, :volumen_interior, :cap_maleta, :cap_estanque
  attr_accessible :largo_pickup, :ancho_pickup, :alto_pickup
  validates :largo, :ancho, :alto, :peso, :volumen_interior, :cap_maleta, :cap_estanque, :numericality => true
  validates :largo_pickup, :ancho_pickup, :alto_pickup, :numericality => true
  validates :abs, :anclaje_infantil, :encendido_auto_luz, :airbags, :sensor_lluvia, :seguro_infantil, :monitor_presion, :numericality => true
  validates :control_traccion, :numericality => true
  validates :consumo_ciudad, :consumo_carretera, :dist_estanque_ciudad, :dist_estanque_carretera, :potencia, :numericality => true
  validates :torque, :cap_remolque, :velocidad_max, :cap_carga_kg, :cap_carga_m3, :de_0_a_100, :numericality => true
  validates :alzavidrios_electricos, :ac, :climatizador, :smart_key, :ctrl_radio_volante, :asientos_calefaccion, :asientos_cuero, :numericality => true
  validates :gps, :dvd, :sensor_retroceso, :camara_retroceso, :velocidad_crucero, :espejos_electricos, :numericality => true
  validates :precio, :cap_pasajeros, :motor, :numericality => true
  validates :llantas_aleacion, :llantas_aluminio, :sunroof, :neblineros_front, :neblineros_back, :numericality => true
  validates :marca, :model, :version, :image_reference, :presence => true
  validates :cant_parlantes, :bluetooth, :aux, :usb, :numericality => true
end
