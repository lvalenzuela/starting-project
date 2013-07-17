class MapComputerAditionalFeature < ActiveRecord::Base
  attr_accessible :computer_id, :computer_aditional_feature_id

  belongs_to :computer
  belongs_to :computers_aditional_feature
end
