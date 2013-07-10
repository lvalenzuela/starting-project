class ComputersMarca < ActiveRecord::Base
  has_many :computers
  attr_accessible :marca
end
