class ComputersCategory < ActiveRecord::Base
  has_many :computers
  attr_accessible :category
end
