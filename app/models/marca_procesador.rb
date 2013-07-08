class MarcaProcesador < ActiveRecord::Base
  # atributos
  #   id
  #   marca
  
  has_many :smartphones
end
