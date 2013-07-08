class SmartphoneSensor < ActiveRecord::Base
  attr_accessible :nombre, :descripcion
  
  has_many :map_smartphone_sensors
  has_many :smartphones, through: :map_smartphone_sensors
end
