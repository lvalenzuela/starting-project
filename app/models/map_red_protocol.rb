class MapRedProtocol < ActiveRecord::Base  
  attr_accessible :red_id, :red_protocol_id

  belongs_to :red
  belongs_to :red_protocol
end
