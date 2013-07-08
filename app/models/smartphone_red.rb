class SmartphoneRed < ActiveRecord::Base
  attr_accessible :nombre, :descripcion
  
  has_many :map_smartphone_reds
  has_many :smartphones, through: :map_smartphone_reds
  
  has_many :map_smartphone_red_protocols
  has_many :smartphone_red_protocols, through: :map_smartphone_red_protocols
end
