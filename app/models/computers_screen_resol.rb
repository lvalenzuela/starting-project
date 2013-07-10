class ComputersScreenResol < ActiveRecord::Base
  has_many :computers
  attr_accessible :resolucion
end
