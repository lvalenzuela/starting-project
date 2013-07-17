class DisplayResolution < ActiveRecord::Base
  # atributos
  #   id
  #   resolution

  attr_accessible :resolution
  
  has_many :map_display_resolution_display_standards
  has_many :display_standards, through: :map_display_resolution_display_standards

  has_many :smartphones
end
