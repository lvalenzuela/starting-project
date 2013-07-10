class ComputersScreenSize < ActiveRecord::Base
  has_many :computers
  attr_accessible :size
end
