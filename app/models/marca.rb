class Marca < ActiveRecord::Base
  # atributos
  #   id
  #   nombre
  #   categoria
  
  has_many :smartphones
  
  has_many :map_marca_categorias
  has_many :categorias, through: :map_marca_categorias
end
