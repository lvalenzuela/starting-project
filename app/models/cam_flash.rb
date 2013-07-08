class CamFlash < ActiveRecord::Base
  # atributos
  #   id
  #   tipo
  #   descripcion
  
  has_many :smartphones
end
