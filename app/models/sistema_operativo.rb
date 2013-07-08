class SistemaOperativo < ActiveRecord::Base
  # atributos
  #   id
  #   nombre
  #   descripcion
  
  has_many :smartphones
end
