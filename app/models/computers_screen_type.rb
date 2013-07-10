class ComputersScreenType < ActiveRecord::Base
  has_many :computers
  attr_accessible :tipo
end
