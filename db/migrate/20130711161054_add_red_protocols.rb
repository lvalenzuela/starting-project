class AddRedProtocols < ActiveRecord::Migration
  def up
  	MapRedProtocol.create(:red_id => 1, :red_protocol_id => 2)
  	MapRedProtocol.create(:red_id => 1, :red_protocol_id => 3)
  	MapRedProtocol.create(:red_id => 1, :red_protocol_id => 4)
   	MapRedProtocol.create(:red_id => 1, :red_protocol_id => 5)

   	MapRedProtocol.create(:red_id => 2, :red_protocol_id => 6)
   	MapRedProtocol.create(:red_id => 2, :red_protocol_id => 7)
   	MapRedProtocol.create(:red_id => 2, :red_protocol_id => 8)
   	MapRedProtocol.create(:red_id => 2, :red_protocol_id => 9)
   	MapRedProtocol.create(:red_id => 2, :red_protocol_id => 10)
   	MapRedProtocol.create(:red_id => 2, :red_protocol_id => 11)
   	MapRedProtocol.create(:red_id => 2, :red_protocol_id => 12)
   	MapRedProtocol.create(:red_id => 2, :red_protocol_id => 13)
   	MapRedProtocol.create(:red_id => 2, :red_protocol_id => 14)
   	MapRedProtocol.create(:red_id => 2, :red_protocol_id => 15)
  end

  def down
  	MapRedProtocol.destroy_all
  end
end
