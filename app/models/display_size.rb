class DisplaySize < ActiveRecord::Base
  # atributos
  #   id
  #   size
  
  attr_accessible :size

  has_many :map_display_size_categoria
  has_many :categorias, through: :map_display_size_categoria

  has_many :smartphones
end
