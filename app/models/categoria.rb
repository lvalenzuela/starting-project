class Categoria < ActiveRecord::Base
  #atributos
  #   id
  #   categoria
  
  has_many :map_marca_categorias
  has_many :marcas, through: :map_marca_categorias
end
