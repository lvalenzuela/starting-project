class ComputersWifi < ActiveRecord::Base
  has_many :computers
  attr_accessible :wifi
end
