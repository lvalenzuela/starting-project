class ComputerAditionalFeature < ActiveRecord::Base
  attr_accessible :feature

  has_many :map_computer_aditional_features
  has_many :computer_aditional_features, through: :map_computer_aditional_features
end
