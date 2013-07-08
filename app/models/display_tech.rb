class DisplayTech < ActiveRecord::Base
  # atributos
  #   id
  #   technology
  #   descripcion
  
  has_many :smartphones
end
