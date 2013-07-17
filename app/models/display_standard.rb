class DisplayStandard < ActiveRecord::Base
  attr_accessible :standard

  has_many :map_display_resolution_display_standards
  has_many :display_resolutions, through: :map_display_resolution_display_standards
end
