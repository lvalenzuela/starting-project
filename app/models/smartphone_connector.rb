class SmartphoneConnector < ActiveRecord::Base
  attr_accessible :nombre, :descripcion
  
  has_many :map_smartphone_connectors
  has_many :smartphones, through: :map_smartphone_connectors
end
