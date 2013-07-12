class Categoria < ActiveRecord::Base
  #atributos
  #   id
  #   categoria
  #   nombre
  attr_accessible :nombre

  has_many :map_display_techs_categorias
  has_many :display_teches, through: :map_display_techs_categorias
  
  has_many :map_display_size_categorias
  has_many :display_sizes, through: :map_display_size_categorias

  has_many :map_marca_categorias
  has_many :marcas, through: :map_marca_categorias
end
