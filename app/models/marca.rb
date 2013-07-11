class Marca < ActiveRecord::Base
  # atributos
  #   id
  #   nombre
  #   categoria
  attr_accessible :nombre_marca
  has_many :smartphones
  has_many :computers
  
  has_many :map_marca_categorias
  has_many :categorias, through: :map_marca_categorias
end
