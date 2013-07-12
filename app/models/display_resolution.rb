class DisplayResolution < ActiveRecord::Base
  # atributos
  #   id
  #   resolution

  attr_accessible :resolution
  
  has_many :smartphones
end
