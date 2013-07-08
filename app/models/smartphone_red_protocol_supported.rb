class SmartphoneRedProtocolSupported < ActiveRecord::Base
  attr_accessible :nombre, :descripcion
  
  has_many :map_smartphone_red_protocol_supporteds
  has_many :smartphone_red_protocol_supporteds, through: :map_smartphone_red_protocol_supporteds
end
