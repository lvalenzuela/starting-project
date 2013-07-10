class ComputersSo < ActiveRecord::Base
  has_many :computers
  attr_accessible :sist_operativo
end
