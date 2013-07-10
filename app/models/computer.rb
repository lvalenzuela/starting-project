class Computer < ActiveRecord::Base
	belongs_to :computers_bluetooth
  belongs_to :computers_categories
	belongs_to :marca
  belongs_to :computers_memoria
	belongs_to :computers_proce
  belongs_to :computers_screen_resol
	belongs_to :computers_screen_size
  belongs_to :computers_screen_type
	belongs_to :computers_so
  belongs_to :computers_wifi
	
  attr_accessible :img_ref, :marca_id, :modelo, :categoria, :sist_operativo_id, :precio, :bateria, :bateria_celdas, :bateria_duracion
  attr_accessible :proce_marca_id, :proce_version, :proce_velocidad, :proce_nucleos
  attr_accessible :memoria, :memoria_tipo, :memoria_velocidad, :memoria_max, :memoria_ranuras
  attr_accessible :disco_capacidad, :disco_velocidad, :disco_ssd, :screen_size, :screen_resol, :screen_type
  attr_accessible :lector_blue_ray, :grabador_blue_ray, :lector_dvd, :grabador_dvd
  attr_accessible :video_modelo, :video_memoria, :video_tipo_memoria, :webcam, :lector_tarjeta_memoria
  attr_accessible :ethernet, :hdmi, :vga, :wifi, :bluetooth, :usb_2, :usb_3, :largo, :ancho, :profundidad
  attr_accessible :id, :peso, :screen_touch
end
