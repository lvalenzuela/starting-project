class DisplayTech < ActiveRecord::Base
  # atributos
  #   id
  #   nombre
  #   descripcion

  has_many :map_display_techs_categoria
  has_many :categorias, through: :map_display_techs_categoria
  
  has_many :smartphones
end
