# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130710204832) do

  create_table "cam_flashs", :force => true do |t|
    t.string   "tipo"
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cars", :force => true do |t|
    t.string   "image_reference",                      :default => "car_images/not_found.png"
    t.integer  "marca"
    t.string   "model"
    t.string   "version"
    t.integer  "precio"
    t.string   "garantia"
    t.integer  "body_style",              :limit => 1
    t.integer  "cap_pasajeros",           :limit => 1
    t.integer  "motor"
    t.integer  "traccion",                :limit => 1
    t.integer  "transmision",             :limit => 1
    t.integer  "combustible",             :limit => 1
    t.integer  "consumo_ciudad"
    t.integer  "consumo_carretera"
    t.integer  "dist_estanque_ciudad"
    t.integer  "dist_estanque_carretera"
    t.integer  "potencia"
    t.integer  "torque"
    t.integer  "cap_remolque"
    t.integer  "velocidad_max"
    t.integer  "cap_carga_kg"
    t.integer  "cap_carga_m3"
    t.integer  "de_0_a_100"
    t.integer  "cant_parlantes"
    t.integer  "bluetooth",               :limit => 1
    t.integer  "aux",                     :limit => 1
    t.integer  "usb",                     :limit => 1
    t.integer  "llantas_aleacion",        :limit => 1
    t.integer  "llantas_aluminio",        :limit => 1
    t.integer  "sunroof",                 :limit => 1
    t.integer  "neblineros_front",        :limit => 1
    t.integer  "neblineros_back",         :limit => 1
    t.integer  "alzavidrios_electricos",  :limit => 1
    t.integer  "ac",                      :limit => 1
    t.integer  "climatizador",            :limit => 1
    t.integer  "smart_key",               :limit => 1
    t.integer  "ctrl_radio_volante",      :limit => 1
    t.integer  "asientos_calefaccion",    :limit => 1
    t.integer  "asientos_cuero",          :limit => 1
    t.integer  "asientos_electricos",     :limit => 1
    t.integer  "gps",                     :limit => 1
    t.integer  "dvd",                     :limit => 1
    t.integer  "sensor_retroceso",        :limit => 1
    t.integer  "camara_retroceso",        :limit => 1
    t.integer  "velocidad_crucero",       :limit => 1
    t.integer  "espejos_electricos",      :limit => 1
    t.integer  "abs",                     :limit => 1
    t.integer  "anclaje_infantil",        :limit => 1
    t.integer  "encendido_auto_luz",      :limit => 1
    t.integer  "airbags",                 :limit => 1
    t.integer  "sensor_lluvia",           :limit => 1
    t.integer  "seguro_infantil",         :limit => 1
    t.integer  "control_estabilidad",     :limit => 1
    t.integer  "monitor_presion",         :limit => 1
    t.integer  "control_traccion",        :limit => 1
    t.integer  "largo"
    t.integer  "ancho"
    t.integer  "alto"
    t.integer  "peso"
    t.integer  "volumen_interior"
    t.integer  "cap_maleta"
    t.integer  "cap_estanque"
    t.integer  "largo_pickup"
    t.integer  "ancho_pickup"
    t.integer  "alto_pickup"
    t.datetime "created_at",                                                                   :null => false
    t.datetime "updated_at",                                                                   :null => false
  end

  create_table "cars_body_styles", :force => true do |t|
    t.string   "body_style"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cars_combustibles", :force => true do |t|
    t.string   "combustible"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "cars_marcas", :force => true do |t|
    t.string   "marca"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cars_traccions", :force => true do |t|
    t.string   "traccion"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "cars_transmisions", :force => true do |t|
    t.string   "transmision"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "categoria", :force => true do |t|
    t.string   "nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "computers", :force => true do |t|
    t.string   "img_ref",                                                           :default => "computer_images/not_found.png"
    t.integer  "marca_id",               :limit => 1
    t.integer  "categoria",              :limit => 1
    t.string   "modelo"
    t.integer  "sist_operativo_id",      :limit => 1
    t.integer  "precio"
    t.string   "bateria"
    t.decimal  "bateria_duracion",                    :precision => 5, :scale => 2
    t.integer  "proce_marca_id"
    t.string   "proce_version"
    t.decimal  "proce_velocidad",                     :precision => 5, :scale => 2
    t.integer  "proce_nucleos",          :limit => 1
    t.integer  "memoria"
    t.integer  "memoria_tipo",           :limit => 1
    t.integer  "memoria_velocidad"
    t.integer  "memoria_max"
    t.integer  "memoria_ranuras"
    t.integer  "disco_capacidad"
    t.integer  "disco_velocidad"
    t.integer  "disco_ssd",              :limit => 1
    t.integer  "screen_size",            :limit => 1
    t.integer  "screen_resol",           :limit => 1
    t.integer  "screen_type",            :limit => 1
    t.integer  "lector_blue_ray",        :limit => 1
    t.integer  "grabador_blue_ray",      :limit => 1
    t.integer  "lector_dvd",             :limit => 1
    t.integer  "grabador_dvd",           :limit => 1
    t.string   "video_modelo"
    t.integer  "video_memoria"
    t.integer  "video_tipo_memoria",     :limit => 1
    t.integer  "webcam",                 :limit => 1
    t.string   "lector_tarjeta_memoria"
    t.integer  "ethernet",               :limit => 1
    t.integer  "hdmi",                   :limit => 1
    t.integer  "vga",                    :limit => 1
    t.integer  "wifi",                   :limit => 1
    t.integer  "bluetooth",              :limit => 1
    t.integer  "usb_2",                  :limit => 1
    t.decimal  "largo",                               :precision => 5, :scale => 2
    t.decimal  "ancho",                               :precision => 5, :scale => 2
    t.decimal  "profundidad",                         :precision => 5, :scale => 2
    t.datetime "created_at",                                                                                                     :null => false
    t.datetime "updated_at",                                                                                                     :null => false
    t.string   "peso"
    t.integer  "usb_3"
    t.integer  "screen_touch",           :limit => 1
    t.integer  "bateria_celdas"
  end

  create_table "computers_bluetooths", :force => true do |t|
    t.string   "bluetooth"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "computers_categories", :force => true do |t|
    t.string   "category"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "computers_marcas", :force => true do |t|
    t.string   "marca"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "computers_memoria", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "computers_proces", :force => true do |t|
    t.string   "marca"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "computers_screen_resols", :force => true do |t|
    t.string   "resolucion"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "computers_screen_sizes", :force => true do |t|
    t.string   "size"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "computers_screen_types", :force => true do |t|
    t.string   "tipo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "computers_sos", :force => true do |t|
    t.string   "sist_operativo"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "computers_wifis", :force => true do |t|
    t.string "wifi"
  end

  create_table "display_depths", :force => true do |t|
    t.string   "profundidad"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "display_resolutions", :force => true do |t|
    t.string   "resolution"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "display_sizes", :force => true do |t|
    t.string   "size"
    t.string   "aspect_ratio"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "display_techs", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "map_marca_categoria", :id => false, :force => true do |t|
    t.integer  "marca_id"
    t.integer  "categoria_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "map_smartphone_connectors", :id => false, :force => true do |t|
    t.integer  "smartphone_id"
    t.integer  "smartphone_connector_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "map_smartphone_red_protocol_supporteds", :id => false, :force => true do |t|
    t.integer  "smartphone_red_protocol_id"
    t.integer  "smartphone_red_protocol_supported_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  create_table "map_smartphone_red_protocols", :id => false, :force => true do |t|
    t.integer  "smartphone_red_id"
    t.integer  "smartphone_red_protocol_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  create_table "map_smartphone_reds", :id => false, :force => true do |t|
    t.integer  "smartphone_id"
    t.integer  "smartphone_red_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "map_smartphone_sensors", :id => false, :force => true do |t|
    t.integer  "smartphone_id"
    t.integer  "smartphone_sensor_id"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "marca_procesadors", :force => true do |t|
    t.string   "nombre_marca"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "marcas", :force => true do |t|
    t.string   "nombre_marca"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "sistema_operativos", :force => true do |t|
    t.string   "nombre"
    t.string   "version"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "smarphone_red_protocols", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "smartphone_connectors", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "smartphone_red_protocol_supporteds", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "smartphone_sensors", :force => true do |t|
    t.string   "nombre"
    t.text     "descripcion"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "smartphones", :force => true do |t|
    t.string   "img_ref",                       :default => "smartphone_images/not_found.png"
    t.string   "modelo"
    t.integer  "precio"
    t.integer  "proce_num_cores"
    t.integer  "proce_speed"
    t.string   "proce_modelo"
    t.integer  "almacenamiento"
    t.float    "cam_resolution"
    t.float    "cam_front_resolution"
    t.boolean  "cam_autofoco"
    t.integer  "dim_alto"
    t.integer  "dim_ancho"
    t.integer  "dim_profundidad"
    t.integer  "dim_peso"
    t.integer  "battery_capacity"
    t.boolean  "battery_usb_rechargeable"
    t.boolean  "battery_wireless_rechargeable"
    t.integer  "marca_id"
    t.integer  "sistema_operativo_id"
    t.integer  "display_tech_id"
    t.integer  "display_depth_id"
    t.integer  "display_size_id"
    t.integer  "display_resolution_id"
    t.integer  "marca_procesador_id"
    t.integer  "cam_flash_id"
    t.datetime "created_at",                                                                   :null => false
    t.datetime "updated_at",                                                                   :null => false
  end

end
