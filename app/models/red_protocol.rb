class RedProtocol < ActiveRecord::Base
  attr_accessible :nombre, :descripcion
  
  has_many :map_red_protocols
  has_many :reds, through: :map_red_protocols
  
  has_many :map_red_protocol_supporteds
  has_many :red_protocol_supporteds, through: :map_red_protocol_supporteds
end