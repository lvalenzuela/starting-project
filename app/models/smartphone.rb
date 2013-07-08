class Smartphone < ActiveRecord::Base
  attr_accessible :img_ref, :modelo, :precio
  
  attr_accessible :proce_num_cores, :proce_speed, :almacenamiento
  
  atrr_accessible :cam_resolution, :cam_front_resolution, :cam_autofoco
  
  attr_accessible :dim_alto, :dim_ancho, :dim_prof, :dim_peso
  
  attr_accessible :battery_capacity, :battery_usb_recargable, :battery_wireless_rechargable
  
  belongs_to :marca
  belongs_to :display_tech
  belongs_to :display_depth
  belongs_to :display_size
  belongs_to :display_resolution
  belongs_to :marca_procesador
  belongs_to :sistema_operativo
  belongs_to :cam_flash
  
  has_many :map_smartphone_reds  
  has_many :smartphone_reds, through: :map_smartphone_reds
  
  has_many :map_smartphone_sensors
  has_many :smartphone_sensors, through: :map_smartphone_sensors
  
  has_many :map_smartphone_connectors
  has_many :smartphone_connectors, through: :map_smartphone_connectors  
  
  #####################################################################################################################
  #atrr_accessible :sen_acelerometro, :sen_geomagnetico, :sen_giroscopio, :sen_rgb, :sen_gestos
  #attr_accessible :sen_temperatura, :sen_barometro, :sen_humedad
  
  #attr_accessible :net_2g_edge, :net_3g, :net_4g, :net_wifi, :net_wifi_direct, :bluetooth, :net_prox_nfc, :net_pc_sync
  
  #attr_accessible :conn_usb, :conn_audifonos, :conn_mem_externa, :conn_sim, :conn_cel_conn, :conn_mhl
  
  #attr_accessible :geolocalizacion
end
