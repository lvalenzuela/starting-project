class MapRedProtocolSupported < ActiveRecord::Base  
  belongs_to :red_protocol
  belongs_to :red_protocol_supported
end