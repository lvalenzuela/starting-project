class MapDisplayResolutionDisplayStandard < ActiveRecord::Base
  attr_accessible :display_resolution_id, :display_standard_id

  belongs_to :display_resolution
  belongs_to :display_standard
end
