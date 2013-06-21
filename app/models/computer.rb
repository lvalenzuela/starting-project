class Computer < ActiveRecord::Base
  attr_accessible :img_ref, :marca, :modelo, :categoria, :sist_operativo, :precio, :bateria, :bateria_duracion
  attr_accessible :proce_marca, :proce_version, :proce_velocidad, :proce_nucleos
  attr_accessible :memoria, :memoria_tipo, :memoria_velocidad, :memoria_max, :memoria_ranuras
  attr_accessible :disco_capacidad, :disco_velocidad, :disco_ssd, :screen_size, :screen_resol, :screen_type
  attr_accessible :lector_blue_ray, :grabador_blue_ray, :lector_dvd, :grabador_dvd
  attr_accessible :video_modelo, :video_memoria, :video_tipo_memoria, :webcam, :lector_tarjeta_memoria
  attr_accessible :ethernet, :hdmi, :vga, :wifi, :bluetooth, :usb, :largo, :ancho, :profundidad
end
