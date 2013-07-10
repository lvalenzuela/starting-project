class ComputersProce < ActiveRecord::Base
  has_many :computers
  attr_accessible :marca
end
