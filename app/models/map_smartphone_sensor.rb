class MapSmartphoneSensor < ActiveRecord::Base
  
  belongs_to :smartphone
  belongs_to :smartphone_sensor  
end
