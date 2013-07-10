class ComputersBluetooth < ActiveRecord::Base
  has_many :computers
  attr_accessible :bluetooth
end
