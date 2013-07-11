class AditionalRedProtocol < ActiveRecord::Migration
  def up
  	MapRedProtocol.create(:red_id => 2, :red_protocol_id => 5)
  	MapRedProtocol.create(:red_id => 2, :red_protocol_id => 16)
  	MapRedProtocol.create(:red_id => 1, :red_protocol_id => 16)
  end

  def down
  end
end
