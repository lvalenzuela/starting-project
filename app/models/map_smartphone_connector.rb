class MapSmartphoneConnector < ActiveRecord::Base
  
  belongs_to :smartphone
  belongs_to :smartphone_connector
end
