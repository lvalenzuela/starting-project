class Categoria < ActiveRecord::Base
  #atributos
  #   id
  #   categoria
  #   nombre
  attr_accessible :nombre
  
  has_many :map_marca_categorias
  has_many :marcas, through: :map_marca_categorias
end
